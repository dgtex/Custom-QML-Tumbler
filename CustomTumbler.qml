import QtQuick 2.3

Rectangle {
    id: root
    height: 160
    width: 160
    gradient: Gradient {
        GradientStop { position: 0.0; color: "#CCCCDD" }
        GradientStop { position: 1.0; color: "#9999AA" }
    }
    radius: 20

    property int minValue: 0
    property int maxValue: 100
    property int stepSize: 5
    property int value: 90

    Component.onCompleted: {
        reloadModel()
    }

    onMinValueChanged: {
        reloadModel()
    }

    onMaxValueChanged: {
        reloadModel()
    }

    onStepSizeChanged: {
        reloadModel()
    }

    onValueChanged: {
        setActive(root.value / root.stepSize, true)
    }

    function reloadModel()
    {
        tumblerModel.clear()
        tumblerModel.append({"val":""})
        for(var i = minValue; i < maxValue - minValue; i+= stepSize)
        {
            tumblerModel.append({"val":i.toString()})
        }
        tumblerModel.append({"val":"", "active":false})
        setActive(root.value / root.stepSize, true)
    }

    function setActive(index, reposition)
    {
        for(var i = 0; i < tumblerModel.count; i++)
        {
            tumblerModel.setProperty(i, "active", false)
        }
        tumblerModel.setProperty(index, "active", true)
        root.value = index * stepSize
        if(reposition)
            tumblerMain.positionViewAtIndex(index, ListView.Center)
    }

    ListModel {
        id: tumblerModel
    }

    Component {
        id: tumblerDelegate

        Rectangle {
            anchors.left: parent.left
            anchors.right: parent.right
            height: 50
            color: "transparent"

            Text {
                text: val
                color: "black"
                font.pointSize: 30
                anchors.centerIn: parent
                opacity: active ? 1 : 0.3
            }
        }
    }

    Rectangle {
        id: indicator
        anchors.left: parent.left
        anchors.right: parent.right
        height: 60
        color: "transparent"
        anchors.verticalCenter: parent.verticalCenter
        border.width: 5
        border.color: "#FFFF66"
        radius: 10
    }

    ListView {
        id: tumblerMain
        model: tumblerModel
        delegate: tumblerDelegate
        spacing: 10
        anchors.fill: parent
        clip: true
        onFlickEnded: {
            if(indexAt(0, contentY + 25) == -1)
            {
                var topPixels = 0
                var bottomPixels = 0
                var topY = contentY + 25
                var bottomY = contentY + 25

                while(indexAt(0, topY) == -1)
                {
                    topPixels++
                    topY--

                    if(topPixels > 1000)
                        break;
                }

                while(indexAt(0, bottomY) == -1)
                {
                    bottomPixels++
                    bottomY++

                    if(bottomPixels > 1000)
                        break;
                }

                if(topPixels > bottomPixels)
                {
                    setActive(indexAt(0, bottomY) + 1, false)
                    positionViewAtIndex(indexAt(0, bottomY) + 1, ListView.Center)
                }
                else
                {
                    setActive(indexAt(0, topY) + 1, false)
                    positionViewAtIndex(indexAt(0, topY) + 1, ListView.Center)
                }
            }
            else
            {
                setActive(indexAt(0, contentY + 25) + 1, false)
                positionViewAtIndex(indexAt(0, contentY + 25) + 1, ListView.Center)
            }
        }

        onDragEnded: {
            if(indexAt(0, contentY + 25) == -1)
            {
                var topPixels = 0
                var bottomPixels = 0
                var topY = contentY + 25
                var bottomY = contentY + 25

                while(indexAt(0, topY) == -1)
                {
                    topPixels++
                    topY--

                    if(topPixels > 1000)
                        break;
                }

                while(indexAt(0, bottomY) == -1)
                {
                    bottomPixels++
                    bottomY++

                    if(bottomPixels > 1000)
                        break;
                }

                if(topPixels > bottomPixels)
                {
                    setActive(indexAt(0, bottomY) + 1, false)
                    positionViewAtIndex(indexAt(0, bottomY) + 1, ListView.Center)
                }
                else
                {
                    setActive(indexAt(0, topY) + 1, false)
                    positionViewAtIndex(indexAt(0, topY) + 1, ListView.Center)
                }
            }
            else
            {
                setActive(indexAt(0, contentY + 25) + 1, false)
                positionViewAtIndex(indexAt(0, contentY + 25) + 1, ListView.Center)
            }
        }
    }
}
