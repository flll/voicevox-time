#!/bin/sh -e

if [[ $(uname -s) != "Linux" ]] then
    echo "このスクリプトはLinux上でしか実行できません"
    exit 1
fi

cd resource

dir_list=(*/)
echo "ディレクトリ内にある(VOICEVOC音声.wav)をリネームします"
echo "該当するディレクトリを選んでください"
for i in "${!dir_list[@]}"; do
    echo "$((i+1)). ${dir_list[i]%/}"
done

read -p "番号: " num

if ! ((num > 0 && num <= ${#dir_list[@]})); then
    echo "無効な番号が入力されました"
    exit 1
fi

directory=${dir_list[num-1]}

echo "選択されたディレクトリ: $directory"
echo "実行するにはエンターを押してください"
read

cd $directory
# ディレクトリ内のファイルを列挙し、名前を変更する
for file in *.wav; do
    # ファイル名の拡張子を取得
    ext="${file##*.}"
    # __の部分を削除
    name="${file##*_}"
    name="${name%.*}"
    name="${name/お知らせします/inform}"
    name="${name/ちょうどを/60s}"
    name="${name/分/m}"
    name="${name/秒を/s}"
    name="${name/時/h}"
    newname="${name}.${ext}"
    echo $directory/${newname}
    mv "$file" "$newname"
done
