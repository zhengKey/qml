import QtQuick 2.2
import QtQuick.Controls 1.2

Item
{
    id: root
    property int startPage: 1
    property int maxPage: 18
    property int selectedPage: 1
    property int totalRecord: 90
    signal pageClicked( int page )

    height: row.height

    Row
    {
        id: row
        anchors.horizontalCenter: parent.horizontalCenter
        spacing: 5

        Label
        {
            anchors.verticalCenter: parent.verticalCenter
            text: totalRecord.toString( ) +
                  qsTr( " records, total " ) +
                  maxPage.toString( ) +
                  qsTr( " pages" )
        }

        Rectangle
        {
            id: delegateRect_1
            height: innerText_1.height * 1.5
            width: innerText_1.width + height
            border.color: "lightsteelblue"
            border.width: 1
            radius: innerText_1.height / 4
            visible: maxPage > 5 && startPage > 1

            Text
            {
                id: innerText_1
                anchors.centerIn: parent
                text: qsTr( "home" )
            }

            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered:
                {
                    delegateRect_1.color = "steelblue";
                    innerText_1.color = "white"
                }
                onExited:
                {
                    delegateRect_1.color = "white";
                    innerText_1.color = "black"
                }
                onClicked: startPage = 1
            }
        }

        Rectangle
        {
            id: delegateRect_2
            height: innerText_2.height * 1.5
            width: innerText_2.width + height
            border.color: "lightsteelblue"
            border.width: 1
            radius: innerText_2.height / 4
            visible: maxPage > 5 && startPage > 1

            Text
            {
                id: innerText_2
                anchors.centerIn: parent
                text: qsTr( "..." )
            }

            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered:
                {
                    delegateRect_2.color = "steelblue";
                    innerText_2.color = "white"
                }
                onExited:
                {
                    delegateRect_2.color = "white";
                    innerText_2.color = "black"
                }
                onClicked:
                {
                    startPage -= repeater.model;
                    if ( startPage < 1 ) startPage = 1;
                }
            }
        }

        Repeater
        {
            id: repeater
            model: maxPage > 5? 5: maxPage
            Rectangle
            {
                id: delegateRect
                height: innerText.height * 1.5
                width: innerText.width + height
                border.color: ( selectedPage === startPage + index?
                                 "orange": "lightsteelblue" )
                border.width: 1
                radius: innerText.height / 4

                Text
                {
                    id: innerText
                    anchors.centerIn: parent
                    text: ( startPage + index ).toString( )
                }

                MouseArea
                {
                    anchors.fill: parent
                    cursorShape: Qt.PointingHandCursor
                    hoverEnabled: true
                    onEntered:
                    {
                        delegateRect.color = "steelblue";
                        innerText.color = "white"
                    }
                    onExited:
                    {
                        delegateRect.color = "white";
                        innerText.color = "black"
                    }
                    onClicked:
                    {
                        selectedPage = startPage + index;
                        pageClicked( selectedPage );
                    }
                }
            }
        }

        Rectangle
        {
            id: delegateRect_3
            height: innerText_3.height * 1.5
            width: innerText_3.width + height
            border.color: "lightsteelblue"
            border.width: 1
            radius: innerText_3.height / 4
            visible: maxPage > 5 && startPage < maxPage - repeater.model + 1

            Text
            {
                id: innerText_3
                anchors.centerIn: parent
                text: qsTr( "..." )
            }

            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered:
                {
                    delegateRect_3.color = "steelblue";
                    innerText_3.color = "white"
                }
                onExited:
                {
                    delegateRect_3.color = "white";
                    innerText_3.color = "black"
                }
                onClicked:
                {
                    startPage += repeater.model;
                    if ( startPage > maxPage - repeater.model + 1 )
                        startPage = maxPage - repeater.model + 1;
                }
            }
        }

        Rectangle
        {
            id: delegateRect_4
            height: innerText_4.height * 1.5
            width: innerText_4.width + height
            border.color: "lightsteelblue"
            border.width: 1
            radius: innerText_4.height / 4
            visible: maxPage > 5 && startPage < maxPage - repeater.model + 1

            Text
            {
                id: innerText_4
                anchors.centerIn: parent
                text: qsTr( "end" )
            }

            MouseArea
            {
                anchors.fill: parent
                cursorShape: Qt.PointingHandCursor
                hoverEnabled: true
                onEntered:
                {
                    delegateRect_4.color = "steelblue";
                    innerText_4.color = "white"
                }
                onExited:
                {
                    delegateRect_4.color = "white";
                    innerText_4.color = "black"
                }
                onClicked: startPage = maxPage - repeater.model + 1
            }
        }
    }
}
