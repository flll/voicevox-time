# キャラボイスを追加

1. [こちら](https://voicevox.hiroshiba.jp/) からVoicevoxをインストールしてください。
2. `bait.txt`ファイルを開いてください。
3. `[#キャラクター名#,1分]`となるように編集します。
4. Voicevox を起動し、`bait.txt`ファイルを読み込みます。
5. `[フォルダ名]`を考えます。キャラ名にすると良いです。なるべく英語が良いです。
6. `resource/[フォルダ名]`に音声ファイルを生成させます。
7. `index.html`を開きます。
8. <`body`>要素の中に、以下のボタンを追加してください。
   ```
   <button id="[フォルダ名]-Button">[キャラ名]</button>
   ```
9. <`script`>要素の中に、以下のコードを追加してください。
   ```
   addButtonListener('[フォルダ名]-Button', '[フォルダ名]');
   ```

# docker build|run

[![Docker Image Version (latest by date)](https://img.shields.io/docker/v/fjlli/voicevox-time?style=for-the-badge)](https://hub.docker.com/r/fjlli/voicevox-time)
[![Docker Image Size (tag)](https://img.shields.io/docker/image-size/fjlli/voicevox-time/1.1?style=for-the-badge)](https://hub.docker.com/r/fjlli/voicevox-time)

```
docker build -t [tag] .
docker run -d --rm -p 8080:8080 [tag]
```
