import QtQuick 2.7
import QtQuick.Layouts 1.1
import QtQuick.Window 2.0

Rectangle
{
    id: plate1
    implicitHeight: 10*40
    implicitWidth: 10*40
    height: implicitHeight
    width: implicitWidth
    border.width:1
    border.color: "steelblue"

    signal positionSignal(int slice, int mousex, int mousey)
    property int sliceNum: 0

    Grid{
        id: plateGrid
        anchors.fill: parent
        columns:10; rows:10
        property int a: 0
        Repeater{
            id: plateRep
            anchors.fill: parent
            model: parent.columns*parent.rows
            Rectangle{
                id: rect
                height: 40; width: 40
                color: "#eceff1"
                border.width: 1
                border.color: "#607d8b"
                opacity: focus?1:0.2
                MouseArea{
                    id: rectArea
                    anchors.fill: parent
                    hoverEnabled: true
                    onEntered: {
                        plateGrid.a=plateGrid.a+1
                        console.log("changed"+plateGrid.a)
                        rect.focus = 1
                        console.log(rect.opacity)
                        console.log(rect.focus)
                    }
                }
            }
        }
//        MouseArea{
//            id: mouseArea
//            anchors.fill: parent
//            hoverEnabled: true
//            propagateComposedEvents: true
//            onPositionChanged: {
//                sliceNum = parseInt(mouseY/40)*10 + parseInt(mouseX/40)
//                plate1.positionSignal(sliceNum,mouseX,mouseY)
//            }
//        }
    }

}
