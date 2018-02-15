//переключатель

import QtQuick 2.8
import QtQuick.Window 2.2

Window {
    //flags: "FramelessWindowHint"
    id: window
    visible: true
    width: 800; height: 400;
    // color: "transparent"

    Rectangle {
        id: rect
        anchors.fill: parent
        gradient: Gradient
        {
            GradientStop {
                position: 1.0
                color: "lightgreen"
            }
            GradientStop {
                position: 0.7
                color: "darkgreen"
            }
            GradientStop {
                position: 0.68
                color: "blue"
            }
            GradientStop {
                position: 0.0
                color: "lightblue"
            }
        }

        Image {
            id: ball
            source: "qrc:/images/images/labQml/Normal_Ball.png"
            x: ball.width/2; y: window.height-ball.height-50
           //action by click
            MouseArea {
                width: 80; height: 80
                anchors.centerIn: parent
                onClicked: ballBounce.running = true
            }
        }
        Text {
            id: info
            anchors.right: parent.right
            anchors.rightMargin: 10
            text: qsTr("width = %1\ny = %2\nx = %3").arg(ball.width).arg(ball.y).arg(ball.x)

        }

        //Using PathAnimation with PathArc

        ParallelAnimation {
            id: ballBounce
            RotationAnimation {
                target: ball
                properties: "rotation"
                from: 0; to: 359
                direction: RotationAnimation.Numerical
                duration: 2300
            }
            SequentialAnimation{
                PathAnimation {
                    id: pathAnim
                    duration: 2000
                    easing.type: Easing.Linear
                    target: ball
                    orientation: PathAnimation.RightFirst
                    anchorPoint: Qt.point(ball.width/2, ball.height/2)
                    path: Path {
                        startX: ball.width
                        startY: window.height - ball.height
                        PathArc {
                            relativeX: 400; y: window.height - ball.height
                            radiusX: 100; radiusY: 150
                        }
                        PathArc {
                            relativeX: 200; y: window.height-ball.height
                            radiusX: 100; radiusY: 70
                        }
                    }

                }

                NumberAnimation {
                    target: ball
                    properties: "x"
                    from: 650; to: 700
                    easing.type: Easing.Linear
                    duration: 300
                }
            }

        }
    }
}
