# PlantUMLでクラス図を書くときのメモ

## 矢印(--で垂直方向、-で水平方向に配置される)
- 集約(Aggregation)o--：プロパティとして持つ
```PlantUML
// ClassAがClassBを持つ
ClassA o-- ClassB
```
- 関連-->：使う方から使われる方へ矢印を引く
```PlantUML
// ClassAがClassBを使用する
ClassA --> ClassB
```

## 関連名
```PlantUML
// ClassAがClassBを使用する
ClassA --> ClassB : 使用する >
```

## 継承と実装
```PlantUML
// ClassAがClassBを継承する
class ClassA extends ClassB

// ClassAがInterfaceBを実装する
interface InterfaceB
class ClassA implements InterfaceB
```
## 参考
■クラス図（PlantUML）:https://plantuml.com/ja/class-diagram
