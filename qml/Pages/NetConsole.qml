/*
 * Copyright (c) 2015-2016 Alex Spataru <alex_spataru@outlook.com>
 *
 * Permission is hereby granted, free of charge, to any person obtaining a copy
 * of this software and associated documentation files (the "Software"), to deal
 * in the Software without restriction, including without limitation the rights
 * to use, copy, modify, merge, publish, distribute, sublicense, and/or sell
 * copies of the Software, and to permit persons to whom the Software is
 * furnished to do so, subject to the following conditions:
 *
 * The above copyright notice and this permission notice shall be included in
 * all copies or substantial portions of the Software.
 *
 * THE SOFTWARE IS PROVIDED "AS IS", WITHOUT WARRANTY OF ANY KIND, EXPRESS OR
 * IMPLIED, INCLUDING BUT NOT LIMITED TO THE WARRANTIES OF MERCHANTABILITY,
 * FITNESS FOR A PARTICULAR PURPOSE AND NONINFRINGEMENT. IN NO EVENT SHALL THE
 * AUTHORS OR COPYRIGHT HOLDERS BE LIABLE FOR ANY CLAIM, DAMAGES OR OTHER
 * LIABILITY, WHETHER IN AN ACTION OF CONTRACT, TORT OR OTHERWISE, ARISING FROM,
 * OUT OF OR IN CONNECTION WITH THE SOFTWARE OR THE USE OR OTHER DEALINGS IN
 * THE SOFTWARE.
 */

import QtQuick 2.0
import QtQuick.Layouts 1.0
import QtQuick.Controls 2.0

import "../Widgets"
import "../Globals.js" as Globals

Pane {
    //
    // Display incoming NetConsole messages in the UI
    //
    Connections {
        target: DriverStation
        onNewMessage: netconsole.append (message)
    }

    //
    // Here are all the controls
    //
    ColumnLayout {
        anchors.fill: parent
        spacing: Globals.spacing

        //
        // Uneccessary label explaining what is the NetConsole
        //
        Label {
            wrapMode: Text.Wrap
            Layout.fillWidth: true
            text: qsTr ("The NetConsole is a way to remotely view the "
                        + "console output of the robot from any device "
                        + "on the same network.")
        }

        //
        // Holds the NetConsole text
        //
        TextArea {
            id: netconsole
            readOnly: true
            wrapMode: Text.Wrap
            font.family: "Courier"
            Layout.fillWidth: true
            Layout.fillHeight: true
            textFormat: Text.RichText
        }

        //
        // Copy and Clear buttons
        //
        RowLayout {
            spacing: Globals.spacing

            Button {
                text: qsTr ("Copy")
                Layout.fillWidth: true

                onClicked: {
                    netconsole.copy()
                    netconsole.append (qsTr ("NetConsole output copied to clipboard."))
                }
            }

            Button {
                text: qsTr ("Clear")
                Layout.fillWidth: true
                onClicked: netconsole.clear()
            }
        }
    }
}