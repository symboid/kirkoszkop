
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12
import QtQuick.Controls.Material 2.3

ApplicationWindow {
    id: mainWindow

    visible: true

    Material.background: "#EEEEFF"

    visibility: Window.Maximized
    width: 900
    height: 600

    MainScreen {
        anchors.fill: parent
    }
}
