
import QtQuick 2.12
import QtQuick.Controls 2.5
import QtQuick.Window 2.12

ApplicationWindow {
    id: mainWindow

    visible: true

    visibility: Window.Maximized
    width: 900
    height: 600

    MainScreen {
        anchors.fill: parent
    }
}
