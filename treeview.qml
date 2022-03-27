import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4

Window {
    visible: true

    TreeView {
        id: treeView
        anchors.fill: parent

        TableViewColumn {
            title: "Value"
            role: "display"
            width: 100
            delegate: Rectangle {
                anchors.fill: parent
                Text {
                    anchors.fill: parent
                    id: textDisplay
                    visible: true
                    text: model.display
                }

                TextInput {
                    anchors.fill: parent
                    id: textEdit
                    text: model.edit;
                    visible: false

                    onAccepted: {
                        model.edit=textEdit.text
                        textEdit.visible=false
                        textDisplay.visible=true
                    }
                }

                MouseArea {
                    anchors.fill: parent
                    onDoubleClicked: {
                        textDisplay.visible=false;
                        textEdit.visible=true;
                    }
                }
            }
        }

        model:{
                     ListElement { name: "通用设置"}
                     ListElement { name: "波形图"}
                     ListElement { name: "宽带图"}
                     ListElement { name: "窄带图"}
                     ListElement { name: "共振峰"}
                     ListElement { name: "LPC频谱"}
                     ListElement { name: "基频图" }
                     ListElement { name: "能量图"}
                     ListElement { name: "过零率"}
                }
    }
}