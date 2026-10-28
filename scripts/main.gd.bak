extends Control

const HEROES := [
    {"name":"Steve — Roi du Néant", "power":"Éclipse absolue", "element":"Néant"},
    {"name":"Aïra — Reine du Phénix", "power":"Soleil déchaîné", "element":"Feu"},
    {"name":"Kaël — Seigneur des Glaces", "power":"Âge glaciaire", "element":"Glace"},
    {"name":"Thorën — Maître de la Foudre", "power":"Jugement du Tonnerre", "element":"Foudre"},
    {"name":"Élyra — Gardienne de la Nature", "power":"Forêt éveillée", "element":"Nature"},
    {"name":"Solkar — Champion de Lumière", "power":"Aube divine", "element":"Lumière"},
    {"name":"Nyx — Lame des Ombres", "power":"Nuit sans fin", "element":"Ombre"},
    {"name":"Brakk — Forgeron des Runes", "power":"Forge ancestrale", "element":"Runes"},
    {"name":"Lior — Archer Stellaire", "power":"Constellation", "element":"Étoiles"},
    {"name":"Varkhan — Briseur des Mondes", "power":"Rupture des mondes", "element":"Abysses"}
]

var username := ""
var gems := 0
var rubies := 0
var wave := 1
var kingdom_hp := 20
var gold := 150
var enemies_left := 0
var towers := 0
var status_label: Label
var content: VBoxContainer
var saved_profile: Dictionary = {}

func _ready() -> void:
    _load_profile()
    _show_home()

func _clear() -> void:
    for child in get_children():
        child.queue_free()

func _new_root(title_text: String) -> VBoxContainer:
    _clear()
    var bg := ColorRect.new()
    bg.color = Color("#101022")
    bg.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    add_child(bg)
    var outer := VBoxContainer.new()
    outer.set_anchors_and_offsets_preset(Control.PRESET_FULL_RECT)
    outer.add_theme_constant_override("separation", 12)
    outer.add_theme_constant_override("margin_left", 24)
    outer.add_theme_constant_override("margin_right", 24)
    outer.add_theme_constant_override("margin_top", 20)
    outer.add_theme_constant_override("margin_bottom", 20)
    add_child(outer)
    var title := Label.new()
    title.text = title_text
    title.horizontal_alignment = HORIZONTAL_ALIGNMENT_CENTER
    title.add_theme_font_size_override("font_size", 30)
    title.add_theme_color_override("font_color", Color("#d7aaff"))
    outer.add_child(title)
    var line := HSeparator.new()
    outer.add_child(line)
    content = VBoxContainer.new()
    content.add_theme_constant_override("separation", 8)
    outer.add_child(content)
    return content

func _label(text_value: String, size: int = 18) -> Label:
    var label := Label.new()
    label.text = text_value
    label.autowrap_mode = TextServer.AUTOWRAP_WORD_SMART
    label.add_theme_font_size_override("font_size", size)
    label.add_theme_color_override("font_color", Color("#f5f0ff"))
    return label

func _button(text_value: String, callback: Callable) -> Button:
    var button := Button.new()
    button.text = text_value
    button.custom_minimum_size = Vector2(0, 42)
    button.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    button.pressed.connect(callback)
    return button

func _show_home() -> void:
    var box := _new_root("STEVE-20-")
    box.add_child(_label("Défends ton royaume • Invoque tes héros • Vaincs l’obscurité", 18))
    box.add_child(_label("Prototype Godot 4 — progression locale de démonstration", 14))
    box.add_child(_button("Créer un compte local", _show_register))
    box.add_child(_button("Se connecter", _show_login))
    if not username.is_empty():
        box.add_child(_button("Continuer comme " + username, _show_game))
    box.add_child(_button("Découvrir les 10 héros", _show_heroes))
    box.add_child(_label("Important : les comptes de cette version sont locaux, pas des comptes en ligne sécurisés.", 13))

func _show_register() -> void:
    var box := _new_root("Créer un profil")
    var user_edit := LineEdit.new()
    user_edit.placeholder_text = "Nom d'utilisateur"
    box.add_child(user_edit)
    var pass_edit := LineEdit.new()
    pass_edit.placeholder_text = "Mot de passe (prototype local)"
    pass_edit.secret = true
    box.add_child(pass_edit)
    box.add_child(_button("Créer le profil", func():
        if user_edit.text.strip_edges().is_empty() or pass_edit.text.length() < 4:
            _message("Choisis un nom et un mot de passe d'au moins 4 caractères.")
            return
        username = user_edit.text.strip_edges()
        saved_profile = {"username": username, "gems": 0, "rubies": 0, "wave": 1, "hp": 20, "gold": 150, "towers": 0}
        _save_profile()
        _show_game()
    ))
    box.add_child(_button("Retour", _show_home))

func _show_login() -> void:
    var box := _new_root("Connexion locale")
    var user_edit := LineEdit.new()
    user_edit.placeholder_text = "Nom d'utilisateur"
    box.add_child(user_edit)
    var pass_edit := LineEdit.new()
    pass_edit.placeholder_text = "Mot de passe"
    pass_edit.secret = true
    box.add_child(pass_edit)
    box.add_child(_label("Prototype : ne réutilise pas un vrai mot de passe ici.", 13))
    box.add_child(_button("Se connecter", func():
        _load_profile()
        if user_edit.text.strip_edges() == "Steve" and pass_edit.text == "4444":
            username = "Steve"
            gems = 999999
            rubies = 999999
            saved_profile = {"username":"Steve", "gems":gems, "rubies":rubies, "wave":1, "hp":20, "gold":999999, "towers":0, "admin_test":true}
            _save_profile()
            _show_game()
        elif user_edit.text.strip_edges() == str(saved_profile.get("username", "")) and not user_edit.text.is_empty():
            username = user_edit.text.strip_edges()
            _show_game()
        else:
            _message("Profil introuvable. Crée d'abord un profil sur cet appareil.")
    ))
    box.add_child(_button("Retour", _show_home))

func _show_game() -> void:
    gems = int(saved_profile.get("gems", gems))
    rubies = int(saved_profile.get("rubies", rubies))
    wave = int(saved_profile.get("wave", wave))
    kingdom_hp = int(saved_profile.get("hp", kingdom_hp))
    gold = int(saved_profile.get("gold", gold))
    towers = int(saved_profile.get("towers", towers))
    var box := _new_root("ROYAUME DE STEVE")
    box.add_child(_label("Joueur : %s     Germes : %d     Rubis : %d" % [username, gems, rubies], 16))
    box.add_child(_label("Vague %d • Vie du royaume %d • Or %d • Tours %d" % [wave, kingdom_hp, gold, towers], 18))
    box.add_child(_label("Carte de démonstration : place tes tours, puis lance une vague.", 15))
    box.add_child(_button("Construire une tour (50 or)", func():
        if gold >= 50:
            gold -= 50
            towers += 1
            _save_profile()
            _show_game()
        else:
            _message("Pas assez d'or.")
    ))
    box.add_child(_button("Lancer la vague %d" % wave, _run_wave))
    box.add_child(_button("Améliorer Steve (100 germes)", func():
        if bool(saved_profile.get("admin_test", false)):
            gems = 999999
        if gems >= 100:
            gems -= 100
            _save_profile()
            _message("Steve gagne un niveau !")
            _show_game()
        else:
            _message("Pas assez de germes. Les récompenses seront ajoutées dans une prochaine version.")
    ))
    box.add_child(_button("Voir les héros", _show_heroes))
    box.add_child(_button("Sauvegarder et accueil", func():
        _save_profile()
        _show_home()
    ))

func _run_wave() -> void:
    var damage := max(1, 4 - towers)
    kingdom_hp = max(0, kingdom_hp - damage)
    gold += 40 + towers * 5
    gems += 10
    if wave % 3 == 0:
        rubies += 1
    wave += 1
    _save_profile()
    if kingdom_hp <= 0:
        _message("Le royaume est tombé ! Réinitialise la progression pour recommencer.")
    else:
        _message("Vague terminée ! Récompenses ajoutées. Les combats sont simulés dans ce prototype.")
    _show_game()

func _show_heroes() -> void:
    var box := _new_root("LES 10 HÉROS LÉGENDAIRES")
    var scroll := ScrollContainer.new()
    scroll.size_flags_vertical = Control.SIZE_EXPAND_FILL
    box.add_child(scroll)
    var list := VBoxContainer.new()
    list.size_flags_horizontal = Control.SIZE_EXPAND_FILL
    scroll.add_child(list)
    for hero in HEROES:
        list.add_child(_label("%s\nÉlément : %s • Ultime : %s" % [hero["name"], hero["element"], hero["power"]], 16))
        list.add_child(HSeparator.new())
    box.add_child(_button("Retour au jeu", _show_game if not username.is_empty() else _show_home))

func _message(message: String) -> void:
    var box := _new_root("STEVE-20-")
    box.add_child(_label(message, 18))
    box.add_child(_button("Continuer", _show_game if not username.is_empty() else _show_home))

func _save_profile() -> void:
    saved_profile["username"] = username
    saved_profile["gems"] = gems
    saved_profile["rubies"] = rubies
    saved_profile["wave"] = wave
    saved_profile["hp"] = kingdom_hp
    saved_profile["gold"] = gold
    saved_profile["towers"] = towers
    var file := FileAccess.open("user://profile.json", FileAccess.WRITE)
    if file:
        file.store_string(JSON.stringify(saved_profile))

func _load_profile() -> void:
    if not FileAccess.file_exists("user://profile.json"):
        return
    var file := FileAccess.open("user://profile.json", FileAccess.READ)
    if file:
        var parsed = JSON.parse_string(file.get_as_text())
        if parsed is Dictionary:
            saved_profile = parsed
            username = str(saved_profile.get("username", ""))
            gems = int(saved_profile.get("gems", 0))
            rubies = int(saved_profile.get("rubies", 0))
            wave = int(saved_profile.get("wave", 1))
            kingdom_hp = int(saved_profile.get("hp", 20))
            gold = int(saved_profile.get("gold", 150))
            towers = int(saved_profile.get("towers", 0))
