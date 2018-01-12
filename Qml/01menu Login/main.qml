import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    flags: "FramelessWindowHint"
    visible: true
    width: 400; height: 200;
        Image {
            id: backIm
            source: "qrc:/images/images/labQml/bluebackground.png"
        }
        Image {
            id: btnLog
            source: "qrc:/images/images/labQml/bluebutton.png"
            anchors.top: parent.top
            anchors.topMargin: 16
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: iconLog
                source: "qrc:/images/images/labQml/login.png"
                anchors.verticalCenter: parent.verticalCenter
                anchors.left: parent.left
                anchors.leftMargin: 30
            }
            Text {
                id: txtLog
                text: qsTr("Login")
                anchors.left: iconLog.right
                anchors.leftMargin: 80
                anchors.verticalCenter: parent.verticalCenter
                color: "#ffffff"
                font.family: "Helvetica"
                font.pixelSize: 30
                font.bold: true
            }
            MouseArea {
                onClicked: Qt.quit()
                anchors.fill: parent
                hoverEnabled: true
                onEntered: { txtLog.color = "Orange"}
                onExited:  {txtLog.color = "White"}
            }
        }

        Image {
            id: btnOut
            source: "qrc:/images/images/labQml/bluebutton.png"
            anchors.bottom: parent.bottom
            anchors.bottomMargin: 16
            anchors.horizontalCenter: parent.horizontalCenter
            Image {
                id: imOut
                source: "qrc:/images/images/labQml/signout.png"
                anchors.left: parent.left
                anchors.leftMargin: 30
                anchors.verticalCenter: parent.verticalCenter
            }
            Text {
                text: qsTr("Sign Out")
                font {family: "Helvetica"; pixelSize: 30; bold: true}
                color: "white"
                anchors.left: imOut.right
                anchors.leftMargin: 80
                anchors.verticalCenter: parent.verticalCenter
            }
        }
    }

