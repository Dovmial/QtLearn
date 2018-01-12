import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    flags: "FramelessWindowHint"
    visible: true
    width: 400; height: 400;color: "transparent"
    Rectangle {
        id: luRect
        width: 190; height: 190
        color: focus?"blue":"lightblue"
        focus: true
        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }

    }
    Rectangle {
        id: ruRect
        width: 190; height: 190
        color: focus? "#00ff00":"green"
        KeyNavigation.down: brRect
        KeyNavigation.left: luRect
        anchors.right: parent.right
        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
    }
    Rectangle {
        id: blRect
        width: 190; height: 190
        color: focus? "black":"gray"
        KeyNavigation.up: luRect
        KeyNavigation.right: brRect
        anchors.bottom: parent.bottom
        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true
        }
    }
    Rectangle {
        id: brRect
        width: 190; height: 190
        color: focus? "#9900cc":"violet"
        KeyNavigation.up: ruRect
        KeyNavigation.left: blRect
        anchors.right: parent.right
        anchors.bottom: parent.bottom
        MouseArea {
            anchors.fill: parent
            onClicked: parent.focus = true

        }
    }
    Rectangle {

        width: 20; height: 20
        anchors.centerIn: parent
        color: focus?"red":"pink"
        Text {
            text: "X"
            font.bold: true
            font.pixelSize: 18
            anchors.centerIn: parent
            color: "white"

        }
        MouseArea {
            anchors.fill: parent
            onClicked: Qt.quit()
            hoverEnabled: true
            onEntered: parent.color = "red"
            onExited: parent.color = "pink"
        }
    }


}

