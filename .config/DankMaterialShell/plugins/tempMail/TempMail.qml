import QtQuick
import Quickshell
import qs.Services

Item {
    id: root

    // Plugin properties
    property var pluginService: null
    property string trigger: "!mail"

    // Plugin interface signals
    signal itemsChanged()

    Component.onCompleted: {
        console.info("TempMail: Plugin loaded")

        // Load custom trigger from settings
        if (pluginService) {
            trigger = pluginService.loadPluginData("tempMail", "trigger", "!mail")
        }
    }

    // Required function: Get items for launcher
    function getItems(query) {
        const baseItems = [
            {
                name: "Get Temporary Mail",
                icon: "material:terminal",
                comment: "Get a new temp mail",
                action: "script:lethe",
                categories: ["TempMail"]
            }
        ]

        if (!query || query.length === 0) {
            return baseItems
        }

        // Filter items based on query
        const lowerQuery = query.toLowerCase()
        return baseItems.filter(item => {
            return item.name.toLowerCase().includes(lowerQuery) ||
                   item.comment.toLowerCase().includes(lowerQuery)
        })
    }

    // Required function: Execute item action
    function executeItem(item) {
        if (!item || !item.action) {
            console.warn("TempMail: Invalid item or action")
            return
        }

        console.log("TempMail: Executing item:", item.name, "with action:", item.action)

        const actionParts = item.action.split(":")
        const actionType = actionParts[0]
        const actionData = actionParts.slice(1).join(":")

        switch (actionType) {
            case "script":
                runScript(actionData)
                showToast("Temp Mail copied to clipboard.")
                break
            default:
                console.warn("TempMail: Unknown action type:", actionType)
                showToast("Unknown action: " + actionType)
        }
    }

    // Helper functions for different action types
    function showToast(message) {
        if (typeof ToastService !== "undefined") {
            ToastService.showInfo("Temp Mail", message)
        } else {
            console.log("TempMail Toast:", message)
        }
    }

    function runScript(command) {
        Quickshell.execDetached(["lethe", "--help"])
    }

    // Watch for trigger changes
    onTriggerChanged: {
        if (pluginService) {
            pluginService.savePluginData("tempMail", "trigger", trigger)
        }
    }
}
