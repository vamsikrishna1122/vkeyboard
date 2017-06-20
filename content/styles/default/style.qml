/******************************************************************************
**
** Copyright (C) 2015 The Qt Company Ltd.
** Contact: http://www.qt.io/licensing/
**
** This file is part of the Qt Virtual Keyboard module.
**
** $QT_BEGIN_LICENSE:COMM$
**
** Commercial License Usage
** Licensees holding valid commercial Qt licenses may use this file in
** accordance with the commercial license agreement provided with the
** Software or, alternatively, in accordance with the terms contained in
** a written agreement between you and The Qt Company. For licensing terms
** and conditions see http://www.qt.io/terms-conditions. For further
** information use the contact form at http://www.qt.io/contact-us.
**
** $QT_END_LICENSE$
**
******************************************************************************/

import QtQuick 2.0
import QtQuick.Enterprise.VirtualKeyboard 2.0
import QtQuick.Enterprise.VirtualKeyboard.Styles 2.0

KeyboardStyle {
    id: currentStyle
    readonly property bool compactSelectionList: [InputEngine.Pinyin, InputEngine.Cangjie, InputEngine.Zhuyin].indexOf(InputContext.inputEngine.inputMode) !== -1
    readonly property string fontFamily: "Roboto"
    readonly property real keyBackgroundMargin: Math.round(13 * scaleHint)
    readonly property real keyContentMargin: Math.round(45 * scaleHint)
    readonly property real keyIconScale: scaleHint * 0.6
    readonly property string resourcePrefix: "qrc:/QtQuick/Enterprise/VirtualKeyboard/content/styles/default/"

    readonly property string inputLocale: InputContext.locale
    property color inputLocaleIndicatorColor: "white"
    property Timer inputLocaleIndicatorHighlightTimer: Timer {
        interval: 1000
        onTriggered: inputLocaleIndicatorColor = "gray"
    }
    onInputLocaleChanged: {
        inputLocaleIndicatorColor = "white"
        inputLocaleIndicatorHighlightTimer.restart()
    }

    property bool inputCheck: false

    keyboardDesignWidth: 2540  //2560
    keyboardDesignHeight: 750  //800
    keyboardRelativeLeftMargin:inputCheck ?  200 / keyboardDesignWidth :90 / keyboardDesignWidth
    keyboardRelativeRightMargin: inputCheck ? 200 / keyboardDesignWidth : 100 / keyboardDesignWidth
    keyboardRelativeTopMargin: 13 / keyboardDesignHeight
    keyboardRelativeBottomMargin: 86 / keyboardDesignHeight

    keyboardBackground: Rectangle {
        color: "#ECEEEE"
    }

    keyPanel: KeyPanel {
        Rectangle {
            id: keyBackground
            radius: 5
            color: "#E4E5E7"
            anchors.fill: parent
            anchors.margins: keyBackgroundMargin
            Text {
                id: keyText
                text: control.displayText
                color: "#2FA3EE"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                anchors.margins: keyContentMargin
                font {
                    family: fontFamily
                    weight: Font.Normal
                    pixelSize: 82 * scaleHint
                    capitalization: control.uppercased ? Font.AllUppercase : Font.MixedCase
                }
            }
        }
        states: [
            State {
                name: "pressed"
                when: control.pressed
                PropertyChanges {
                    target: keyBackground
                    opacity: 0.75
                }
                PropertyChanges {
                    target: keyText
                    opacity: 0.5
                }
            },
            State {
                name: "disabled"
                when: !control.enabled
                PropertyChanges {
                    target: keyBackground
                    opacity: 0.75
                }
                PropertyChanges {
                    target: keyText
                    opacity: 0.05
                }
            }
        ]
    }

    backspaceKeyPanel: KeyPanel {
        Rectangle {
            id: backspaceKeyBackground
            radius: 5
            color: "#E4E5E7"
            anchors.fill: parent
            anchors.margins: keyBackgroundMargin
            Image {
                id: backspaceKeyIcon
                anchors.centerIn: parent
//                sourceSize.width: 159 * keyIconScale
//                sourceSize.height: 88 * keyIconScale
                smooth: false
//				scale: scaleHint*2
                source: resourcePrefix + "images/backspace-868482.png"
            }
        }
        states: [
            State {
                name: "pressed"
                when: control.pressed
                PropertyChanges {
                    target: backspaceKeyBackground
                    opacity: 0.80
                }
                PropertyChanges {
                    target: backspaceKeyIcon
                    opacity: 0.6
                }
            },
            State {
                name: "disabled"
                when: !control.enabled
                PropertyChanges {
                    target: backspaceKeyBackground
                    opacity: 0.8
                }
                PropertyChanges {
                    target: backspaceKeyIcon
                    opacity: 0.2
                }
            }
        ]
    }

    enterKeyPanel: KeyPanel {
        Rectangle {
            id: enterKeyBackground
            radius: 5
            color: "#E4E5E7"
            anchors.fill: parent
            anchors.margins: keyBackgroundMargin

            Text {
                id: enterKeyText
                visible: text.length !== 0
                text: control.actionId === EnterKeyAction.None ? "Next" : control.displayTextEnterKeyAction.label
                clip: true
                fontSizeMode: Text.HorizontalFit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                color: "#2FA3EE"
                font {
                    family: fontFamily
                    weight: Font.Normal
                    pixelSize: 84 * scaleHint
                }
                anchors.fill: parent
                anchors.margins: Math.round(32 * scaleHint)
            }
        }
        states: [
            State {
                name: "pressed"
                when: control.pressed
                PropertyChanges {
                    target: enterKeyBackground
                    opacity: 0.80
                }
//                PropertyChanges {
//                    target: enterKeyIcon
//                    opacity: 0.6
//                }
                PropertyChanges {
                    target: enterKeyText
                    opacity: 0.6
                }
            },
            State {
                name: "disabled"
                when: !control.enabled
                PropertyChanges {
                    target: enterKeyBackground
                    opacity: 0.8
                }
//                PropertyChanges {
//                    target: enterKeyIcon
//                    opacity: 0.2
//                }
                PropertyChanges {
                    target: enterKeyText
                    opacity: 0.05
                }
            }
        ]
    }

    hideKeyPanel: KeyPanel {
        Rectangle {
            id: hideKeyBackground
            radius: 5
            color: "#E4E5E7"
            anchors.fill: parent
            anchors.margins: keyBackgroundMargin
            Image {
                id: hideKeyIcon
                anchors.centerIn: parent
//                sourceSize.width: 144 * keyIconScale
//                sourceSize.height: 127 * keyIconScale
                smooth: false
//				scale: scaleHint*2
                source: resourcePrefix + "images/hidekeyboard-868482.png"
            }
        }
        states: [
            State {
                name: "pressed"
                when: control.pressed
                PropertyChanges {
                    target: hideKeyBackground
                    opacity: 0.80
                }
                PropertyChanges {
                    target: hideKeyIcon
                    opacity: 0.6
                }
            },
            State {
                name: "disabled"
                when: !control.enabled
                PropertyChanges {
                    target: hideKeyBackground
                    opacity: 0.8
                }
                PropertyChanges {
                    target: hideKeyIcon
                    opacity: 0.2
                }
            }
        ]
    }

    shiftKeyPanel: KeyPanel {
        Rectangle {
            id: shiftKeyBackground
            radius: 5
            color: "#E4E5E7"
            anchors.fill: parent
            anchors.margins: keyBackgroundMargin
            Image {
                id: shiftKeyIcon
                anchors.centerIn: parent
                sourceSize.width: 144 * keyIconScale
                sourceSize.height: 134 * keyIconScale
                smooth: false
                source: resourcePrefix + "images/shift-80c342.png"
            }
            states: [
                State {
                    name: "capslock"
                    when: InputContext.capsLock
                    PropertyChanges {
                        target: shiftKeyBackground
//                        color: "#5a892e"
                    }
                    PropertyChanges {
                        target: shiftKeyIcon
                        source: resourcePrefix + "images/shift-c5d6b6.png"
                    }
                },
                State {
                    name: "shift"
                    when: InputContext.shift
                    PropertyChanges {
                        target: shiftKeyIcon
                        source: resourcePrefix + "images/shift-80c342.png"
                    }
                }
            ]
        }
        states: [
            State {
                name: "pressed"
                when: control.pressed
                PropertyChanges {
                    target: shiftKeyBackground
                    opacity: 0.80
                }
                PropertyChanges {
                    target: shiftKeyIcon
                    opacity: 0.6
                }
            },
            State {
                name: "disabled"
                when: !control.enabled
                PropertyChanges {
                    target: shiftKeyBackground
                    opacity: 0.8
                }
                PropertyChanges {
                    target: shiftKeyIcon
                    opacity: 0.2
                }
            }
        ]
    }

    spaceKeyPanel: KeyPanel {
        Rectangle {
            id: spaceKeyBackground
            radius: 5
            color: "#E4E5E7"
            anchors.fill: parent
            anchors.margins: keyBackgroundMargin
            Text {
                id: spaceKeyText
                text: ""/*Qt.locale(InputContext.locale).nativeLanguageName*/
                color: currentStyle.inputLocaleIndicatorColor
                Behavior on color { PropertyAnimation { duration: 250 } }
                anchors.centerIn: parent
                font {
                    family: fontFamily
                    weight: Font.Normal
                    pixelSize: 48 * scaleHint
                }
            }
        }
        states: [
            State {
                name: "pressed"
                when: control.pressed
                PropertyChanges {
                    target: spaceKeyBackground
                    opacity: 0.80
                }
            },
            State {
                name: "disabled"
                when: !control.enabled
                PropertyChanges {
                    target: spaceKeyBackground
                    opacity: 0.8
                }
            }
        ]
    }

    symbolKeyPanel: KeyPanel {
        Rectangle {
            id: symbolKeyBackground
            radius: 5
            color: "#E4E5E7"
            anchors.fill: parent
            anchors.margins: keyBackgroundMargin
            Text {
                id: symbolKeyText
                text: control.displayText
                color: "#2FA3EE"
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                anchors.margins: keyContentMargin
                font {
                    family: fontFamily
                    weight: Font.Normal
                    pixelSize: 64 * scaleHint
                    capitalization: Font.AllUppercase
                }
            }
        }
        states: [
            State {
                name: "pressed"
                when: control.pressed
                PropertyChanges {
                    target: symbolKeyBackground
                    opacity: 0.80
                }
                PropertyChanges {
                    target: symbolKeyText
                    opacity: 0.6
                }
            },
            State {
                name: "disabled"
                when: !control.enabled
                PropertyChanges {
                    target: symbolKeyBackground
                    opacity: 0.8
                }
                PropertyChanges {
                    target: symbolKeyText
                    opacity: 0.2
                }
            }
        ]
    }

    characterPreviewMargin: 0
    characterPreviewDelegate: Item {
        property string text
        id: characterPreview
        Rectangle {
            id: characterPreviewBackground
            anchors.fill: parent
            color: "black"
            radius: 5
            Text {
                id: characterPreviewText
                color: "#2FA3EE"
                text: characterPreview.text
                fontSizeMode: Text.HorizontalFit
                horizontalAlignment: Text.AlignHCenter
                verticalAlignment: Text.AlignVCenter
                anchors.fill: parent
                anchors.margins: Math.round(48 * scaleHint)
                font {
                    family: fontFamily
                    weight: Font.Normal
                    pixelSize: 82 * scaleHint
                }
            }
        }
    }

    alternateKeysListItemWidth: 99 * scaleHint
    alternateKeysListItemHeight: 150 * scaleHint
    alternateKeysListDelegate: Item {
        id: alternateKeysListItem
        width: alternateKeysListItemWidth
        height: alternateKeysListItemHeight
        Text {
            id: listItemText
            text: model.text
            color: "#868482"
            font {
                family: fontFamily
                weight: Font.Normal
                pixelSize: 52 * scaleHint
            }
            anchors.centerIn: parent
        }
        states: State {
            name: "current"
            when: alternateKeysListItem.ListView.isCurrentItem
            PropertyChanges {
                target: listItemText
                color: "white"
            }
        }
    }
    alternateKeysListHighlight: Rectangle {
        color: "#5d5b59"
        radius: 5
    }
    alternateKeysListBackground: Rectangle {
        color: "#1e1b18"
        radius: 5
    }

    selectionListHeight: 85 * scaleHint
    selectionListDelegate: SelectionListItem {
        id: selectionListItem
        width: Math.round(selectionListLabel.width + selectionListLabel.anchors.leftMargin * 2)
        Text {
            id: selectionListLabel
            anchors.left: parent.left
            anchors.leftMargin: Math.round((compactSelectionList ? 50 : 140) * scaleHint)
            anchors.verticalCenter: parent.verticalCenter
            text: decorateText(display, wordCompletionLength)
            color: "#80c342"
            font {
                family: fontFamily
                weight: Font.Normal
                pixelSize: 44 * scaleHint
            }
            function decorateText(text, wordCompletionLength) {
                if (wordCompletionLength > 0) {
                    return text.slice(0, -wordCompletionLength) + '<u>' + text.slice(-wordCompletionLength) + '</u>'
                }
                return text
            }
        }
        Rectangle {
            id: selectionListSeparator
            width: 4 * scaleHint
            height: 36 * scaleHint
            radius: 2
            color: "#35322f"
            anchors.verticalCenter: parent.verticalCenter
            anchors.right: parent.left
        }
        states: State {
            name: "current"
            when: selectionListItem.ListView.isCurrentItem
            PropertyChanges {
                target: selectionListLabel
                color: "white"
            }
        }
    }
//    selectionListBackground: Rectangle {
//        color: "#1e1b18"
//    }
    selectionListAdd: Transition {
        NumberAnimation { property: "y"; from: wordCandidateView.height; duration: 200 }
        NumberAnimation { property: "opacity"; from: 0; to: 1; duration: 200 }
    }
    selectionListRemove: Transition {
        NumberAnimation { property: "y"; to: -wordCandidateView.height; duration: 200 }
        NumberAnimation { property: "opacity"; to: 0; duration: 200 }
    }

    navigationHighlight: Rectangle {
        color: "transparent"
        border.color: "yellow"
        border.width: 5
    }

    traceInputKeyPanelDelegate: TraceInputKeyPanel {
        traceMargins: keyBackgroundMargin
        Rectangle {
            id: traceInputKeyPanelBackground
            radius: 5
            color: "#35322f"
            anchors.fill: parent
            anchors.margins: keyBackgroundMargin
            Text {
                id: hwrInputModeIndicator
                visible: control.patternRecognitionMode === InputEngine.HandwritingRecoginition
                text: InputContext.inputEngine.inputMode === InputEngine.Latin ? "Abc" : "123"
                color: "white"
                anchors.left: parent.left
                anchors.top: parent.top
                anchors.margins: keyContentMargin
                font {
                    family: fontFamily
                    weight: Font.Normal
                    pixelSize: 44 * scaleHint
                    capitalization: {
                        if (InputContext.capsLock)
                            return Font.AllUppercase
                        if (InputContext.shift)
                            return Font.MixedCase
                        return Font.AllLowercase
                    }
                }
            }
        }
        Canvas {
            id: traceInputKeyGuideLines
            anchors.fill: traceInputKeyPanelBackground
            opacity: 0.1
            onPaint: {
                var ctx = getContext("2d")
                ctx.lineWidth = 1
                ctx.strokeStyle = Qt.rgba(0xFF, 0xFF, 0xFF)
                ctx.clearRect(0, 0, width, height)
                var i
                if (control.horizontalRulers) {
                    for (i = 0; i < control.horizontalRulers.length; i++) {
                        ctx.beginPath()
                        ctx.moveTo(0, control.horizontalRulers[i])
                        ctx.lineTo(width, control.horizontalRulers[i])
                        ctx.stroke()
                    }
                }
                if (control.verticalRulers) {
                    for (i = 0; i < control.verticalRulers.length; i++) {
                        ctx.beginPath()
                        ctx.moveTo(control.verticalRulers[i], 0)
                        ctx.lineTo(control.verticalRulers[i], height)
                        ctx.stroke()
                    }
                }
            }
        }
    }

    traceCanvasDelegate: TraceCanvas {
        id: traceCanvas
        onAvailableChanged: {
            if (!available)
                return
            var ctx = getContext("2d")
            ctx.lineWidth = 10 * scaleHint
            ctx.lineCap = "round"
            ctx.strokeStyle = Qt.rgba(0xFF, 0xFF, 0xFF)
            ctx.fillStyle = ctx.strokeStyle
        }
        autoDestroyDelay: 800
        onTraceChanged: if (trace === null) opacity = 0
        Behavior on opacity { PropertyAnimation { easing.type: Easing.OutCubic; duration: 150 } }
    }

    popupListDelegate: SelectionListItem {
        property real cursorAnchor: popupListLabel.x + popupListLabel.width
        id: popupListItem
        width: popupListLabel.width + popupListLabel.anchors.leftMargin * 2
        height: popupListLabel.height + popupListLabel.anchors.topMargin * 2
        Text {
            id: popupListLabel
            anchors.left: parent.left
            anchors.top: parent.top
            anchors.leftMargin: popupListLabel.height / 2
            anchors.topMargin: popupListLabel.height / 3
            text: decorateText(display, wordCompletionLength)
            color: "#5CAA15"
            font {
                family: fontFamily
                weight: Font.Normal
                pixelSize: Qt.inputMethod.cursorRectangle.height * 0.8
            }
            function decorateText(text, wordCompletionLength) {
                if (wordCompletionLength > 0) {
                    return text.slice(0, -wordCompletionLength) + '<u>' + text.slice(-wordCompletionLength) + '</u>'
                }
                return text
            }
        }
        states: State {
            name: "current"
            when: popupListItem.ListView.isCurrentItem
            PropertyChanges {
                target: popupListLabel
                color: "black"
            }
        }
    }

    popupListBackground: Item {
        Rectangle {
            width: parent.width
            height: parent.height
            color: "white"
            border {
                width: 1
                color: "#929495"
            }
        }
    }

    popupListAdd: Transition {
        NumberAnimation { property: "opacity"; from: 0; to: 1.0; duration: 200 }
    }

    popupListRemove: Transition {
        NumberAnimation { property: "opacity"; to: 0; duration: 200 }
    }
}
