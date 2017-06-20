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
import QtQuick.Layouts 1.0
import QtQuick.Enterprise.VirtualKeyboard 2.0

KeyboardLayoutLoader {
    property bool secondPage
    onVisibleChanged: if (!visible) secondPage = false
    sourceComponent: page1
    Component {
        id: page1
        KeyboardLayout {
            keyWeight: 160
            KeyboardRow {
                Key {
                    key: Qt.Key_1
                    text: "1"
                }
                Key {
                    key: Qt.Key_2
                    text: "2"
                }
                Key {
                    key: Qt.Key_3
                    text: "3"
                }
                Key {
                    key: Qt.Key_4
                    text: "4"
                }
                Key {
                    key: Qt.Key_5
                    text: "5"
                }
                Key {
                    key: Qt.Key_6
                    text: "6"
                }
                Key {
                    key: Qt.Key_7
                    text: "7"
                }
                Key {
                    key: Qt.Key_8
                    text: "8"
                }
                Key {
                    key: Qt.Key_9
                    text: "9"
                }
                Key {
                    key: Qt.Key_0
                    text: "0"
                }
                BackspaceKey {}
            }
            KeyboardRow {
                FillerKey {
                    weight: 50
                }
                Key {
                    key: Qt.Key_At
                    text: "!"
                }
                Key {
                    key: Qt.Key_NumberSign
                    text: "@"
                }
                Key {
                    key:  Qt.Key_Percent
                    text: "#"
                }
                Key {
                    key: Qt.Key_Ampersand
                    text: "$"
                }
                Key {
                    key: Qt.Key_Asterisk
                    text: "%"
                }
                Key {
                    key: Qt.Key_Minus
                    text: "^"
                }
                Key {
                    key: Qt.Key_Plus
                    text: "&"
                }
                Key {
                    key: Qt.Key_ParenLeft
                    text: "*"
                }
                Key {
                    key: Qt.Key_ParenRight
                    text: "?"
                }
                EnterKey {
                    weight: 217//283
                }
                FillerKey {
                    weight: 50
                }
            }
            KeyboardRow {
                keyWeight: 160

                Key {
                    key: Qt.Key_Colon
                    text: ":"
                }
                Key {
                    key:  Qt.Key_Semicolon
                    text: ';'
                }
                Key {
                    key: Qt.Key_Less
                    text: "<"
                }
                Key {
                    key: Qt.Key_Greater
                    text: ">"
                }
                Key {
                    key: Qt.Key_Apostrophe
                    text: "{"
                }
                Key {
                    key: Qt.Key_Forward
                    text: "}"
                }
                Key {
                    key: Qt.Key_Backslash
                    text: "/"
                }
                Key {
                    key: Qt.Key_Slash
                    text: "\\"
                }
                Key {
                    key: Qt.Key_Comma
                    text: ","
                }
                Key {
                    key: Qt.Key_Period
                    text: "."
                }
                Key {
                    key: Qt.Key_Alt
                    text: "|"
                }
            }
            KeyboardRow {
                keyWeight: 120
                SymbolModeKey {
                    weight: 180
                    displayText: "ABC"
                }
                SpaceKey {
                    weight: 1250
                }
                Key {
                    key: Qt.Key_hyphen
                    text: "-"
                }
                Key {
                    key: 0xE000
                    text: "_"
                }
                HideKeyboardKey {
                    weight: 204
                }
            }
        }
    }
}
