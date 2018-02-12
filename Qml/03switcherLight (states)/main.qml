//переключатель

import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    flags: "FramelessWindowHint"
    visible: true
    width: 200; height: 250;
    color: "transparent"

    Rectangle {
        width: 150; height: 250
        color: "lightgrey"
        id: switcher

        Rectangle {
            id: switcherChild
            width: 130; height: 230
            anchors.centerIn: parent
            color: "grey"
            state: "OFF"
            //Кнопка
            Rectangle {
                id: lightSwitch
                width: 120; height: 220/3
                color: "lightgrey"
                MouseArea {
                    anchors.fill: parent
                    onClicked: switcherChild.state == "ON"? switcherChild.state = "OFF":
                                                            switcherChild.state = "ON"
                }
                Text {
                    anchors.centerIn: parent
                    text: qsTr("PRESS")
                    font {family: "helvetica"; pixelSize: 20}
                }
            }

            // состояния с переходом
            states: [
                State {
                    name: "OFF"
                    AnchorChanges {
                        target: lightSwitch
                        anchors.horizontalCenter: parent.horizontalCenter
                        anchors.top: parent.top

                    }
                    PropertyChanges {
                        target: lightSwitch
                        anchors.topMargin: 5

                    }
                },
                State {
                    name: "ON"
                    AnchorChanges {
                        target: lightSwitch
                        anchors.bottom: parent.bottom
                        anchors.horizontalCenter: parent.horizontalCenter
                    }
                    PropertyChanges {
                        target: lightSwitch
                        anchors.bottomMargin: 5
                    }
                }
            ]
            transitions: Transition {
                from: "ON"; to:"OFF"
                reversible: true
                AnchorAnimation {duration: 300}}

        }

        //кнопка выхода
        Rectangle {
            color: "red"
            width: 10; height: 10
            anchors.right: parent.right
           // anchors.leftMargin: 5
            Text {
                text: "X"
                font {bold: true; pixelSize: 8}
                anchors.centerIn: parent
            }
            MouseArea {
                anchors.fill: parent
                onClicked: Qt.quit()
            }
        }
    }

    //боковой индикатор
    Rectangle {
        height: 30; width: 30
        anchors.verticalCenter: switcher.verticalCenter
        anchors.left: switcher.right
        anchors.leftMargin: 10
        color: switcherChild.state == "OFF"? "black": "green"
    }
}

