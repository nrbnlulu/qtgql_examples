import QtQuick
import QtQuick.Controls
import QtQuick.Controls.Material

ApplicationWindow {id:root
    width: 500;
    height: 400;
    visible: true;
    Material.theme: Material.Dark
    Material.accent: Material.Orange
    property var continent: query?.data?.continent;

    ListView{id: countries_view
    anchors.fill: parent;
        model: root.continent?.countries;
        header:Rectangle{
            color: Material.color(Material.Indigo)
            width: ListView.view.width;
            height: 50;
            Label{
                anchors.centerIn: parent;
                text: `Countries in Continent ${root.continent?.name} (${countries_view.count}):`
            }
        } 
        delegate: Rectangle{                    
            id: country_delegate
            required property var model;
            color: (model.index % 2 == 0)? Material.color(Material.Grey):  Material.color(Material.BlueGrey)
            property var view: ListView.view;
            width: view.width;
            height: 50;
            Label{
                anchors.left: parent.left;
                property var country: country_delegate.model.data;
                text: `${country_delegate.model.index + 1}:  ${country.emoji} capital: ${country.capital}`
            }
        }
    }
}