import QtQuick 2.4
import QtQuick.Window 2.2

Window {
    id: window
    visible: true
    width: 800
    height: 800

    CustomTumbler {
        id: t1
        radius: 0
        width: 120
        suffix: "h"
        value: 0

        Component.onCompleted: {
            var vals = []
            for(var i = 0; i < 24; i++)
                vals[i] = i

            values = vals
        }
    }

    CustomTumbler {
        id: t2
        anchors.left: t1.right
        radius: 0
        width: 120
        suffix: "m"
        value: 0

        Component.onCompleted: {
            var vals = []
            for(var i = 0; i < 60; i++)
                vals[i] = i

            values = vals
        }
    }

    CustomTumbler {
        id: t3
        anchors.left: t2.right
        radius: 0
        width: 120
        values: ["Jan", "Feb", "Mar", "Apr", "May", "Jun", "Jul", "Avg", "Sept", "Oct", "Nov", "Dec"]
        value: "Jan"
    }
}
