import QtQuick 2.7
    import QtQuick.Window 2.2
    import QtQuick.Controls 2.2

    Window {
        visible: true
        width: 640
        height: 480
        title: qsTr("Time Edit")

        TextField{
            id:textEditTD
            text : "00:00:00"
            inputMask: "00:00:00"
            inputMethodHints: Qt.ImhTime
            validator: RegExpValidator { regExp: /^([0-1\s]?[0-9\s]|2[0-3\s]):([0-5\s][0-9\s]):([0-5\s][0-9\s])$ / }
			//validator: IntValidator{bottom: 11; top: 31;}
	

            focus: true

            width:100
            height:50
            background:Rectangle{
                color:"transparent"
                border.color: "red"
                border.width:2
                radius:(width * 0.05)
            }
			
	    Component.oncomponent{
			console.log(textEditTD.acceptableInput)
		}
		 onAccepted: {
		 textEditTD.focus = false
                     console.log("ddddddddddd")
                     }
	    onEditingFinished: {
			 console.log("rrrrrdddddd")
		}
        }
    }