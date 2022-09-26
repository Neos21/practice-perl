
#!/usr/bin/perl
# ↑ Shebang

use strict;
# ↑ 指定しておく

# HTML として表示させるために書いておく
print "Content-type: text/html; charset=UTF-8\n\n";


# 変数宣言
my $text = "ほげほげ";
# 変数を出力する
print $text;


# ファイル操作
my $dir;
eval {
  opendir($dir, "./") or die "Can't open the directory.";
};
if($@) {
  print("MyError : $@");
  exit 1;
}
# 正常時の処理
my @files = readdir($dir);
# ファイルを出力する
foreach my $file (@files) {
  print $file;
}
closedir($dir);


=pod
ココに
複数行コメントが
書ける
=cut


# 変数と文字列結合
my $height = 180;
print '身長は' . $height . "cm です。";


# ヒアドキュメント
print <<EOL;
Hello <abbr title="Common Gateway Interface">CGI</abbr>
EOL
# ヒアドキュメントの変数定義
my $heredoc = <<EOL;
<strong>hoge</strong>
<em>fuga</em>
EOL
print "$heredoc"


# 配列の定義 : 「@」で定義する
my @fruits = ("apple", "orange", "banana");
# 添字で指定して取り出す : 単一要素を取得する際は「$」を使う
print $fruits[0];
# 配列の長さを取得する (JavaScript でいう array.length)
print @fruits;
# 配列の最終要素の添字を取得する (JavaScript でいう array.length - 1)
print $#fruits;
# for を使って順に表示する
for(my $i = 0; $i < @fruits; $i++) {
  print $fruits[$i];
}
# next; → Java でいう continue 相当
# last; → Java でいう break 相当
# foreach を使って順に表示する
foreach my $fruit (@fruits) {
  print $fruit;
}
push(@fruits, "peach");     # 末尾に追加
pop(@fruits);               # 末尾から削除
unshift(@fruits, "peach");  # 先頭に追加
shift(@fruits);             # 先頭から削除


# 連想配列・ハッシュ : 変数定義はドル「$」ではなくパーセント「%」
my %myHash = (
  "name" => "my-hash",
  "version" => "0.0.0"
);
# とりあえず全部出力する
print %myHash;
# 値を取り出す
print $myHash{'name'};
# 順番に取り出す
while(my ($hashKey, $hashValue) = each %myHash) {
  print $hashKey . " : " . $hashValue . "\n";
}


# 無名ハッシュ : 変数定義はドル「$」、つまりスカラ変数
my $myRecord = {
  "name" => "my-record",
  "version" => "0.0.0"
};
# とりあえず全部出力する (リファレンスをデリファレンスして取り出す)
print %{$myRecord};
# 値を取り出す
print $myRecord->{'name'};
# 順番に取り出す
while(my ($recordKey, $recordValue) = each %{$myRecord}) {
  print $recordKey . " : " . $recordValue . "\n";
}


# 環境変数を一覧出力する : %ENV からキーを取得し昇順にソートする
my @keys = keys %ENV;
my @keys = sort { $a cmp $b } @keys;
print "<table border=\"1\">";
foreach my $key (@keys) {
  print "<tr><th>" . $key . "</th><td>" . $ENV{$key} . "</td></tr>";
}
print "</table>";


# Perl パッケージのバージョン確認 : 特殊変数で `$ perl -v` と同等の確認が可能
print $];
