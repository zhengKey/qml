
  import QtQuick 2.12
  import QtQuick.Controls 2.12

  ComboBox {
      id: control
      model: ["First", "Second", "Third"]

      delegate: ItemDelegate {
          width: control.width
          contentItem: Text {
              text: modelData
              color: "#21be2b"
              font: control.font
              elide: Text.ElideRight
              verticalAlignment: Text.AlignVCenter
          }
          highlighted: control.highlightedIndex === index
      }

//      indicator: Canvas {
//          id: canvas
//          x: control.width - width - control.rightPadding
//          y: control.topPadding + (control.availableHeight - height) / 2
//          width: 12
//          height: 8
//          contextType: "2d"

//          Connections {
//              target: control
//              onPressedChanged: canvas.requestPaint()
//          }

//          onPaint: {
//              context.reset();
//              context.moveTo(0, 0);
//              context.lineTo(width, 0);
//              context.lineTo(width / 2, height);
//              context.closePath();
//              context.fillStyle = control.pressed ? "#17a81a" : "#21be2b";
//              context.fill();
//          }
//      }

      contentItem: Text {
          leftPadding: 0
          rightPadding: control.indicator.width + control.spacing

          text: control.displayText
          font: control.font
          color: control.pressed ? "#17a81a" : "#21be2b"
          verticalAlignment: Text.AlignVCenter
          elide: Text.ElideRight
      }


      }
