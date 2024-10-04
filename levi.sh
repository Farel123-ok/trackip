#!/bin/bash

# Menampilkan judul dengan figlet dan lolcat
title() {
    cowsay -f dragon " DI BUAT OLEH LEVIATHAN
    • PROJECT LEVIATHAN
    • CREATE : JUMAT - 9 - 2024
    • MALING² CODE GK MAMPU BUAT? 😂😹😂
    • NO HAPUS CREDIT 😂😹😂" | lolcat
    echo "===========================" | lolcat
    figlet "MADE BY LEVIATHAN" | lolcat
    echo "===========================" | lolcat
}

# Fungsi untuk animasi mengetik
type_animation() {
    local text="$1"
    local delay="${2:-0.03}"  # Default delay
    for ((i = 0; i < ${#text}; i++)); do
        echo -n "${text:$i:1}"
        sleep "$delay"
    done
    echo ""
}

# Fungsi untuk membuka URL
open_url() {
    xdg-open "$1" 2>/dev/null || { echo "Tidak dapat membuka URL"; }
}

# Fungsi untuk menampilkan waktu
show_time() {
    clear
    while true; do
        clear
        echo "========================" | lolcat
        echo "      JAM SEKARANG      " | lolcat
        echo "========================" | lolcat
        echo -n "Tanggal: "
        date "+%A, %d %B %Y" | lolcat
        echo -n "Waktu: "
        date "+%H:%M:%S" | lolcat
        sleep 1
    done
}

# Fungsi untuk permainan tebak angka
guess_number() {
    clear
    title
    type_animation "=== Tebak Angka (1-50) ===" | lolcat
    target=$((RANDOM % 50 + 1))
    attempts=0
    while true; do
        read -p "Tebak angka (atau ketik 'batal' untuk kembali): " guess
        if [[ $guess == "batal" ]]; then
            echo "Permainan dibatalkan." | lolcat
            break
        fi
        ((attempts++))
        if [[ $guess -lt $target ]]; then
            echo "Terlalu rendah!" | lolcat
        elif [[ $guess -gt $target ]]; then
            echo "Terlalu tinggi!" | lolcat
        else
            echo "Selamat! Anda menebak dengan benar dalam $attempts percobaan." | lolcat
            cowsay -f dragon "Jawaban Anda benar!" | lolcat
            break
        fi
    done
    read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..."
}

# Fungsi untuk permainan tebak huruf
guess_letter() {
    clear
    title
    type_animation "=== Tebak Huruf (A-Z) ===" | lolcat
    target=$(echo {A..Z} | tr ' ' '\n' | shuf -n 1)
    attempts=0
    while true; do
        read -p "Tebak huruf (atau ketik 'batal' untuk kembali): " guess
        if [[ $guess == "batal" ]]; then
            echo "Permainan dibatalkan." | lolcat
            break
        fi
        ((attempts++))
        if [[ $guess < $target ]]; then
            echo "Terlalu rendah!" | lolcat
        elif [[ $guess > $target ]]; then
            echo "Terlalu tinggi!" | lolcat
        else
            echo "Selamat! Anda menebak dengan benar dalam $attempts percobaan." | lolcat
            cowsay -f dragon "Jawaban Anda benar!" | lolcat
            break
        fi
    done
    read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..."
}

# Fungsi untuk permainan tebak bendera
guess_flag() {
    clear
    title
    type_animation "=== Tebak Bendera ===" | lolcat
    flags=("🇺🇸" "🇬🇧" "🇫🇷" "🇩🇪" "🇯🇵" "🇧🇷" "🇨🇦" "🇦🇺" "🇮🇳" "🇷🇺")
    random_index=$((RANDOM % 10))
    echo "Tebak bendera: ${flags[$random_index]}" | lolcat
    read -p "Masukkan nama negara (atau ketik 'batal' untuk kembali): " guess
    if [[ $guess == "batal" ]]; then
        echo "Permainan dibatalkan." | lolcat
        return
    fi
    correct_flags=("Amerika" "Inggris" "Prancis" "Jerman" "Jepang" "Brasil" "Kanada" "Australia" "India" "Rusia")
    if [[ "${correct_flags[$random_index]}" == "$guess" ]]; then
        echo "Selamat! Jawaban Anda benar." | lolcat
        cowsay -f dragon "Jawaban Anda benar!" | lolcat
    else
        echo "Jawaban Anda salah. Jawaban yang benar adalah: ${correct_flags[$random_index]}." | lolcat
    fi
    read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..."
}

# Fungsi untuk permainan tebak emoji
guess_emoji() {
    clear
    title
    type_animation "=== Tebak Emoji ===" | lolcat
    emojis=("😀" "😂" "😍" "🤔" "😎" "😢" "😡" "🥳" "😱" "😴" "😈" "😇" "🤖" "👻" "👽" "🐶" "🐱" "🐹" "🐷" "🦁" "🐍")
    random_index=$((RANDOM % 20))
    echo "Tebak emoji: ${emojis[$random_index]}" | lolcat
    read -p "Masukkan deskripsi emoji (atau ketik 'batal' untuk kembali): " guess
    if [[ $guess == "batal" ]]; then
        echo "Permainan dibatalkan." | lolcat
        return
    fi
    echo "Emoji tersebut adalah: ${emojis[$random_index]}" | lolcat
    read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..."
}

# Fungsi untuk permainan Snake (game sederhana)
play_snake() {
    clear
    title
    type_animation "=== Permainan Snake ===" | lolcat
    echo "Gunakan 'w' untuk atas, 's' untuk bawah, 'a' untuk kiri, dan 'd' untuk kanan." | lolcat
    echo "Tekan 'q' untuk keluar." | lolcat
    # Implementasi permainan Snake
    echo "Permainan Snake belum diimplementasikan." | lolcat
    read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..."
}

# Menu website visual
website_menu() {
    clear
    title
    type_animation "=== Menu Website ===" | lolcat
    echo "1. Buka YouTube" | lolcat
    echo "2. Buka Instagram" | lolcat
    echo "3. Buka Telegram" | lolcat
    echo "4. Buka TikTok" | lolcat
    echo "5. Masukkan URL untuk dibuka" | lolcat
    echo "6. Kembali" | lolcat
    read -p "Pilih opsi (1/2/3/4/5/6): " web_option

    case $web_option in
        1) open_url "https://www.youtube.com" ;;
        2) open_url "https://www.instagram.com" ;;
        3) open_url "https://telegram.org" ;;
        4) open_url "https://www.tiktok.com" ;;
        5) read -p "Masukkan URL: " custom_url; open_url "$custom_url" ;;
        6) return ;;
        *) echo "Pilihan tidak valid." | lolcat; read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..." ;;
    esac
}

while true; do
    clear
    title
    type_animation "1. Tampilkan Jam dan Tanggal" | lolcat
    type_animation "2. Get My IP" | lolcat
    type_animation "3. IP Lookup" | lolcat
    type_animation "4. Website Menu" | lolcat
    type_animation "5. Game Menu" | lolcat
    type_animation "6. Exit" | lolcat
    read -p "Pilih opsi (1/2/3/4/5/6): " option

    case $option in
        1) show_time ;; # Menampilkan waktu secara real-time
        2)
            echo "Mengambil IP Anda..." | lolcat
            my_ip=$(curl -s https://api.ipify.org)
            echo "IP Anda: $my_ip" | lolcat
            read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..."
            ;;
        3)
            read -p "Masukkan IP untuk dicari (atau ketik 'batal' untuk kembali): " ip_lookup
            if [[ $ip_lookup == "batal" ]]; then
                echo "IP lookup dibatalkan." | lolcat
            else
                echo "Mencari informasi untuk IP: $ip_lookup..." | lolcat
                ip_info=$(curl -s "https://ipwho.is/$ip_lookup")
                echo "$ip_info" | jq . | lolcat  # Pastikan jq sudah terinstal di Termux
                read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..."
            fi
            ;;
        4) website_menu ;;
        5)
            clear
            title
            type_animation "=== Menu Game ===" | lolcat
            echo "1. Tebak Angka" | lolcat
            echo "2. Tebak Huruf" | lolcat
            echo "3. Tebak Bendera" | lolcat
            echo "4. Tebak Emoji" | lolcat
            echo "5. Snake Game" | lolcat
            echo "6. Kembali" | lolcat
            read -p "Pilih opsi (1/2/3/4/5/6): " game_option

            case $game_option in
                1) guess_number ;;
                2) guess_letter ;;
                3) guess_flag ;;
                4) guess_emoji ;;
                5) play_snake ;;
                6) continue ;;
                *) echo "Pilihan tidak valid." | lolcat; read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..." ;;
            esac
            ;;
        6) echo "Keluar dari program." | lolcat; exit ;;
        *) echo "Pilihan tidak valid." | lolcat; read -n 1 -s -r -p "Tekan [Enter] untuk melanjutkan..." ;;
    esac
done