import java.io.BufferedReader
import java.io.InputStreamReader
import java.io.PrintWriter

val br = BufferedReader(InputStreamReader(System.`in`))
val out = PrintWriter("./code-metrics.md")

fun main() {
    br.use {
        out.use {
//            repeat(readInteger()) { solve() }
            solve()
            out.flush()
        }
    }
}

fun solve() {
    val (countOfStoryBoard, countOfFile, countOfFileOnlyTest, linesOfCode, linesOfCodeOnlyTest) = readLongList()
    val countFileWithoutTest = countOfFile - countOfFileOnlyTest
    val linesOfCodeWithoutTest = linesOfCode - linesOfCodeOnlyTest

    fun printHeader() = out.println("||Swiftファイル数（個）|Swiftファイルの行数(行)")
    fun divAndRound(a: Long, b: Long) = (a + (b / 2)) / b

    out.println("# コードメトリクスのようなもの")
    out.println("## ${countOfStoryBoard}画面合計")
    printHeader()
    out.println("|---|---|---|")
    out.println("|合計|${countOfFile}|${linesOfCode}|")
    out.println("|テストを除外|${countFileWithoutTest}|${linesOfCodeWithoutTest}|")
    out.println("|テストのみ|${countOfFileOnlyTest}|${linesOfCodeOnlyTest}|")
    out.println()

    out.println("## 1画面あたりの平均（小数点以下は四捨五入）")
    printHeader()
    out.println("|---|---|---|")
    out.println("|合計|${divAndRound(countOfFile, 4)}|${divAndRound(linesOfCode, 4)}|")
    out.println("|テストを除外|${divAndRound(countFileWithoutTest, 4)}|${divAndRound(linesOfCodeWithoutTest, 4)}|")
    out.println("|テストのみ|${divAndRound(countOfFileOnlyTest, 4)}|${divAndRound(linesOfCodeOnlyTest, 4)}|")
    out.println()

    out.println("## 1ファイルあたりの平均（小数点以下は四捨五入）")
    out.println("||Swiftファイルの行数(行)")
    out.println("|---|---|")
    out.println("|合計|${divAndRound(linesOfCode, countOfFile)}|")
    out.println("|テストを除外|${divAndRound(linesOfCodeWithoutTest, countFileWithoutTest)}|")
    out.println("|テストのみ|${divAndRound(linesOfCodeOnlyTest, countOfFileOnlyTest)}|")
}

fun readInteger() = Integer.parseInt(br.readLine())
fun readLong() = java.lang.Long.parseLong(br.readLine())
fun readStringList() = br.readLine()!!.split(' ')
fun readIntegerList() = readStringList().map(Integer::parseInt)
fun readLongList() = readStringList().map(java.lang.Long::parseLong)
fun readDoubleList() = readStringList().map(java.lang.Double::parseDouble)
