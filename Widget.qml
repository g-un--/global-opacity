import QtQuick
import Quickshell
import Quickshell.Io
import qs.Commons
import qs.Ui

BarWidget {
  id: root
  moduleName: "global.opacity"

  property real windowOpacity: 0.96
  property bool stateLoaded: false
  readonly property real step: 0.05
  readonly property string statePath: (Quickshell.env("XDG_STATE_HOME") || (Quickshell.env("HOME") + "/.local/state")) + "/omarchy/global-opacity"
  readonly property string helperPath: decodeURIComponent(String(Qt.resolvedUrl("omarchy-global-opacity")).replace(/^file:\/\//, ""))

  implicitWidth: button.implicitWidth
  implicitHeight: button.implicitHeight

  function setOpacity(value) {
    var next = Math.max(0.35, Math.min(1.0, Math.round(value * 20) / 20))
    windowOpacity = next
    applyOpacity(next)
  }

  function applyOpacity(value) {
    Quickshell.execDetached([helperPath, Number(value).toFixed(2)])
  }

  function loadOpacity(value) {
    var parsed = parseFloat(String(value || ""))
    if (!isNaN(parsed)) windowOpacity = Math.max(0.35, Math.min(1.0, parsed))
    stateLoaded = true
    applyOpacity(windowOpacity)
  }

  onBarChanged: if (bar && stateLoaded) applyOpacity(windowOpacity)

  FileView {
    path: root.statePath
    watchChanges: true
    printErrors: false
    onLoaded: root.loadOpacity(text())
    onLoadFailed: {
      root.stateLoaded = true
      root.applyOpacity(root.windowOpacity)
    }
  }

  BarIconButton {
    id: button
    anchors.fill: parent
    bar: root.bar
    text: "󰖔"
    fontSize: Style.font.icon
    tooltipText: "Global window opacity — click or scroll to adjust, right-click for 100%"

    onPressed: function(b) {
      if (b === Qt.LeftButton) root.setOpacity(root.windowOpacity - root.step)
      else if (b === Qt.RightButton) root.setOpacity(1.0)
    }

    onWheelMoved: function(delta) {
      root.setOpacity(root.windowOpacity + (delta > 0 ? root.step : -root.step))
    }
  }
}
