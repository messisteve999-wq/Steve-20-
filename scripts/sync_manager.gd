extends Node
## Point d'entrée pour une future synchronisation cloud.
## La version de départ reste locale et ne prétend pas être un service en ligne.
signal sync_status(message: String)

func sync_now() -> void:
    sync_status.emit("Synchronisation en ligne non configurée. Sauvegarde locale active.")
