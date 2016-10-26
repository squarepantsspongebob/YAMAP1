//1024-1这篇代码有一些问题，暂停重开一个新的
//1025 改成非loader component形式可以正常工作
import QtQuick 2.7
import QtQuick.Window 2.2
import QtQuick.Controls 2.0
import QtQuick.Dialogs 1.2

Window {
    id: mainWindow1
    visible: true
    width: 640
    height: 640
    flags: Qt.FramelessWindowHint|Qt.WindowSystemMenuHint|Qt.WindowMinimizeButtonHint|Qt.Window
    color: "lightgray"

    Loader{
        id: pageLoader
        anchors.centerIn: parent
    }
    Loader{
        id: exitLoader
    }
    Rectangle{
        id: startRec
        width: 300; height: 100
        anchors.centerIn: parent
        color: "lightblue"
        visible: true
        Text{
            text: "Hello World"
            font.pixelSize: 22
            font.bold: true
            anchors.centerIn: parent
        }
        MouseArea{
            anchors.fill: parent
            onClicked: {
                parent.visible=false
                var plateComponent = Qt.createComponent("init.qml")
                if(plateComponent.status == Component.Ready){
                    var plate = plateComponent.createObject(mainWindow1)
                    plate.x = mainWindow1.width/2-200
                    plate.y = mainWindow1.height/2-200
                    mousePositionIndicator.text=plate.sliceNum
                }
            }
        }
    }

    Button{
        id: quitButton
        anchors.top: parent.top
        anchors.right: parent.right
        height: 40; width:50
        text: "Quit"
        onClicked: {
            closeDialog.open()
        }
    }
    Button{
        id: newgameButton
        anchors.bottom: parent.bottom
        anchors.left: parent.left
        height: 40; width:80
        text:"New Game"
    }
    Text
    {
        id: mousePositionIndicator
        anchors.bottom: parent.bottom
        anchors.left: newgameButton.right
        height:40; width: 40
        text: "what"
    }

    Dialog
    {
        id: closeDialog
        title: "Close the Application"
        visible: false
        modality: Qt.ApplicationModal
        standardButtons: StandardButton.Ok | StandardButton.Cancel
        Text{
            anchors.centerIn: parent
            font.pixelSize: 15
            text: "Are you sure to exit?"
        }
        onAccepted: {
            Qt.quit()
        }
    }
}
