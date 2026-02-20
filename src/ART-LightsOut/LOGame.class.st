Class {
	#name : 'LOGame',
	#superclass : 'BorderedMorph',
	#instVars : [
		'cells'
	],
	#category : 'ART-LightsOut',
	#package : 'ART-LightsOut'
}

{ #category : 'accessing' }
LOGame >> cellAt: i at: j [
	"1次元配列のインデックス計算を集約する"

	^ cells at: i - 1 * self cellsPerSide + j
]

{ #category : 'accessing' }
LOGame >> cellsPerSide [
	"The number of cells along each side of the game"

	^ 10
]

{ #category : 'initialization' }
LOGame >> initialize [

	| n sampleCell width height |
	super initialize.
	n := self cellsPerSide.

	"1.盤面データの初期化（１次元配列）"
	cells := Array new: n * n.

	"2.サイズ計算用のサンプルセルを１つ作成"
	sampleCell := LOCell new.
	width := sampleCell width.
	height := sampleCell height.

	"3.盤面（自分自身）の大きさを設定"
	self bounds: (5 @ 5 extent: n * width @ (n * height)).

	"4.全てのセルを生成して配置"
	1 to: n do: [ :i |
			1 to: n do: [ :j |
					| newCell |
					newCell := self newCellAt: i at: j.

					"Arrayのインデックス計算"
					cells at: i - 1 * n + j put: newCell.

					"画面上の位置を設定して自分（Game盤）に追加"
					newCell position:
						j - 1 * width @ (i - 1 * height) + self position.
					self addMorph: newCell ] ]
]

{ #category : 'initialization' }
LOGame >> newCellAt: i at: j [ 
	| c |
	c := LOCell new.
	"マウスアクションを設定（※ここでエラーが出るはず）"
	c mouseAction: [ self toggleNeighboursOfCellAt: i at: j ].
	^ c
]

{ #category : 'game logic' }
LOGame >> toggleNeighboursOfCellAt: i at: j [
    (i > 1)
        ifTrue: [ (self cellAt: i - 1 at: j) toggleState ].
    (i < self cellsPerSide)
        ifTrue: [ (self cellAt: i + 1 at: j) toggleState ].
    (j > 1)
        ifTrue: [ (self cellAt: i at: j - 1) toggleState ].
    (j < self cellsPerSide)
        ifTrue: [ (self cellAt: i at: j + 1) toggleState ]
]
