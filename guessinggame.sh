#!/bin/bash

# Fonction pour compter le nombre de fichiers dans le répertoire actuel
count_files() {
    local num_files=$(ls -l | grep "^-" | wc -l)
    echo "$num_files"
}

# Fonction principale du jeu de devinettes
guessing_game() {
    local num_files=$(count_files)
    local guess

    echo "Bienvenue dans le jeu de devinettes sur le nombre de fichiers dans le répertoire actuel!"

    while true; do
        read -p "Combien de fichiers pensez-vous qu'il y a dans le répertoire actuel ? " guess

        if ! [[ $guess =~ ^[0-9]+$ ]]; then
            echo "Veuillez entrer un nombre valide."
        elif (( guess < num_files )); then
            echo "Votre estimation est trop basse. Essayez encore."
        elif (( guess > num_files )); then
            echo "Votre estimation est trop élevée. Essayez encore."
        else
            echo "Félicitations ! Vous avez deviné le bon nombre de fichiers ($num_files)."
            break
        fi
    done
}

# Appel de la fonction principale
guessing_game
