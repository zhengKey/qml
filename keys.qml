import QtQuick 2.4
import QtQuick.Controls 1.3
import QtQuick.Window 2.2
import QtQuick.Dialogs 1.2

Rectangle{
    id: root
    width:  512
    height: 512
    color: "gray"

    focus: true
    Keys.enabled: true
    Keys.onEscapePressed: Qt.quit();
    Keys.forwardTo: moveText;

    Text {
        id: moveText
        x: 20; y: 20;
        width: 200; height: 30;

        text: "Moving Text"
        color: "blue"
        font {bold: true; pixelSize: 30}

        Keys.enabled: true
        Keys.onPressed: {
            switch (event.key){
            case Qt.Key_Left:
                x -= 10;
                break;
            case Qt.Key_Right:
                x += 10;
                break;
            case Qt.Key_Up:
                y -= 10;
                break;
            case Qt.Key_Down:
                y += 10;
                break;
            default:
                return;
            }
            event.accepted = true;
        }
    }

    CheckBox {
        id: likeQt
        text: "Like Qt Quick"
        z:1

        anchors.left: parent.left
        anchors.leftMargin: 10
        anchors.bottom: parent.bottom
        anchors.bottomMargin: 10
    }
}