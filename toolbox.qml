import QtQuick 2.9
import QtQuick.Window 2.3
import QtQuick.Controls 1.4


Item{

width:200
height:300
ListView{
anchors.fill:parent
model:nestedModel
delegate:categoryDelegate
}
ListModel{
id:nestedModel
ListElement{
categoryName:"Veggies"
collapsed:true
//AListElementcan'tcontainchildelements,butitcancontain
//alistofelements.AlistofListElementscanbeusedasamodel
//justlikeanyothermodeltype.
subItems:[
ListElement{itemName:"Tomato"},
ListElement{itemName:"Tomato"},
ListElement{itemName:"Tomato"},
ListElement{itemName:"Cucumber"},
ListElement{itemName:"Onion"},
ListElement{itemName:"Brains"}
]
}
ListElement{
categoryName:"Fruits"
collapsed:true
subItems:[
ListElement{itemName:"Orange"},
ListElement{itemName:"Apple"},
ListElement{itemName:"Pear"},
ListElement{itemName:"Lemon"}
]
}
ListElement{
categoryName:"Cars"
collapsed:true
subItems:[
ListElement{itemName:"Nissan"},
ListElement{itemName:"Toyota"},
ListElement{itemName:"Chevy"},
ListElement{itemName:"Audi"}
]
}
}
Component{
id:categoryDelegate
Column{
width:200
Rectangle{
id:categoryItem
border.color:"black"
border.width:5
color:"white"
height:50
width:200
Text{
anchors.verticalCenter:parent.verticalCenter
x:15
font.pixelSize:24
text:categoryName
}
Rectangle{
color:"red"
width:30
height:30
anchors.right:parent.right
anchors.rightMargin:15
anchors.verticalCenter:parent.verticalCenter
MouseArea{
anchors.fill:parent
//Togglethe'collapsed'property
onClicked:nestedModel.setProperty(index,"collapsed",!collapsed)
}
}
}
Loader{
id:subItemLoader
//Thisisaworkaroundforabug/featureintheLoaderelement.IfsourceComponentissettonull
//theLoaderelementretainsthesameheightithadwhensourceComponentwasset.Settingvisible
//tofalsemakestheparentColumntreatitasifit'sheightwas0.
visible:!collapsed
property variant subItemModel:subItems
sourceComponent:collapsed?null:subItemColumnDelegate
onStatusChanged:if(status==Loader.Ready)item.model=subItemModel
}
}
}
Component{
id:subItemColumnDelegate
Column{
property alias model:subItemRepeater.model
width:200
Repeater{
id:subItemRepeater
delegate:Rectangle{
color:"#cccccc"
height:40
width:200
border.color:"black"
border.width:2
Text{
anchors.verticalCenter:parent.verticalCenter
x:30
font.pixelSize:18
text:itemName
}
}
}
}
}
}