#!/usr/bin/env ruby

ARRAY30_TABLE_FILE = "array30_27489-V201509-utf8.txt"
JOUYOU_KANJI_BIG5_5401_FILE = "jouyou_kanji_big5_5401.txt"
JOUYOU_KANJI_TW_4808_FILE = "jouyou_kanji_tw_4808.txt"

array30_table = []
File.open(ARRAY30_TABLE_FILE, "r") do |file|
  file.each_line do |line|
    array30_table << line.split.reverse
  end
end

kanji_bank = File.read(JOUYOU_KANJI_BIG5_5401_FILE)

key_mappings = {
  "Q" => "1⇧", "W" => "2⇧", "E" => "3⇧", "R" => "4⇧", "T" => "5⇧", "Y" => "6⇧", "U" => "7⇧", "I" => "8⇧", "O" => "9⇧", "P" => "0⇧",
  "A" => "1-", "S" => "2-", "D" => "3-", "F" => "4-", "G" => "5-", "H" => "6-", "J" => "7-", "K" => "8-", "L" => "9-", ";" => "0-",
  "Z" => "1⇩", "X" => "2⇩", "C" => "3⇩", "V" => "4⇩", "B" => "5⇩", "N" => "6⇩", "M" => "7⇩", "," => "8⇩", "." => "9⇩", "/" => "0⇩",
}

File.open("array30_key_mappings.txt", "w+") do |file|
  array30_table.each do |chr, code|
    if kanji_bank.chars.include?(chr)
      keys = code.chars.map { |c| key_mappings[c] }.join(' ')
      puts "#{chr} - #{code} ( #{keys} )"
      file << "#{chr} - #{code} ( #{keys} )\n"
    end
  end
end
