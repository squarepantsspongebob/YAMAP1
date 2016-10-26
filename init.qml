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

    property int sliceNum: 0

    Grid{
        columns:10; rows:10
        Repeater{
            model: parent.columns*parent.rows
            Rectangle{
                height: 40; width: 40
                color: "#eceff1"
                border.width: 1
                border.color: "#607d8b"
            }
        }
    }
    MouseArea{
        id: mouseArea
        anchors.fill: parent
        hoverEnabled: true
        onPositionChanged: {
            sliceNum = parseInt(mouseY/40)*10 + parseInt(mouseX/40)
            console.log(sliceNum)
        }
    }
}
