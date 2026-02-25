"
This is the first commit of LightsOut on PBE, which was rewritten in Pharo13 using one-dimensional arrays instead of Array2D.
"
Class {
	#name : 'LOGame',
	#superclass : 'BorderedMorph',
	#instVars : [
		'cells',
		'nRows',
		'nColumns'
	],
	#category : 'ART-LightsOut',
	#package : 'ART-LightsOut'
}

{ #category : 'initialization' }
LOGame >> initialize [
	| sampleCell cellWidth cellHeight |
	super initialize.
	
	"1. 盤面サイズの設定（ここを変えるだけで可変になります）"
	nRows := 10.
	nColumns := 10.
	cells := MyGrid rows: nRows columns: nColumns.
	
	"2. セル自体のサイズを LOCell から取得する"
	sampleCell := LOCell new.
	cellWidth := sampleCell width.
	cellHeight := sampleCell height.

	"3. グリッドの生成・配置・アクション設定"
	cells indicesDo: [ :r :c | | cell |
		"最初のセルはサイズ取得に使ったものを再利用、それ以外は新規作成"
		cell := (r = 1 and: [ c = 1 ]) 
			ifTrue: [ sampleCell ] 
			ifFalse: [ LOCell new ].
		
		"セルの座標を設定"
		cell position: ((c - 1) * cellWidth) @ ((r - 1) * cellHeight).
		
		"クリック時の動作をブロックで登録 (mouseActionを利用)"
		cell mouseAction: [ self toggleAtRow: r column: c ].
		
		"グリッドと画面(Morph)に追加"
		cells at: r at: c put: cell.
		self addMorph: cell.
	].

	"4. ゲーム画面全体の大きさをセルに合わせて調整"
	self extent: (nColumns * cellWidth) @ (nRows * cellHeight).
]

{ #category : 'game logic' }
LOGame >> toggleAtRow: r column: c [
	"1. 中心（クリックされたセル）を反転"

	"cells at: r at: c ifPresent: [ :cell | cell toggleState ]."

	"2. 周囲（上下左右）を反転"
	self toggleNeighboursOfCellAt: r at: c
]

{ #category : 'game logic' }
LOGame >> toggleNeighboursOfCellAt: r at: c [
	"上下左右のセルが存在すれば反転させる"

	cells at: r - 1 at: c ifPresent: [ :cell | cell toggleState ]. "上"
	cells at: r + 1 at: c ifPresent: [ :cell | cell toggleState ]. "下"
	cells at: r at: c - 1 ifPresent: [ :cell | cell toggleState ]. "左"
	cells at: r at: c + 1 ifPresent: [ :cell | cell toggleState ] "右"
]
