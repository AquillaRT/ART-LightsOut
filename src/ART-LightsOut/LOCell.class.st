"
I represent a single cell in the Lights Out game.
I am a simple switch that can be either 'on' or 'off'.

When a user clicks on me, I toggle my own state and notify my container (the game board) so that my neighbors can be toggled as well.

Internal Representation and Key Property:
- mouseAction: [Block] A block of code that will be executd when the user clicks on me. This is typically used to tell the game logic to toggle the surrounding cells.

Example of creation:
LOCell new
"
Class {
	#name : 'LOCell',
	#superclass : 'SimpleSwitchMorph',
	#instVars : [
		'mouseAction',
		'game',
		'row',
		'column'
	],
	#category : 'ART-LightsOut',
	#package : 'ART-LightsOut'
}

{ #category : 'accessing' }
LOCell >> column: anObject [ 

	column := anObject
]

{ #category : 'accessing' }
LOCell >> game: anObject [

	game := anObject
]

{ #category : 'initialization' }
LOCell >> initialize [

    super initialize.
    self label: ''.
    self borderWidth: 2.
    bounds := 0 @ 0 corner: 16 @ 16.
    offColor := Color paleYellow.
    onColor := Color paleBlue darker.
    self useSquareCorners.
    self turnOff
]

{ #category : 'accessing' }
LOCell >> mouseAction: aBlock [

	mouseAction := aBlock
]

{ #category : 'event handling' }
LOCell >> mouseUp: anEvent [

	super mouseUp: anEvent .
	mouseAction ifNotNil: [ mouseAction value ]
]

{ #category : 'accessing' }
LOCell >> row: anObject [ 

	row := anObject
]

{ #category : 'logic' }
LOCell >> toggleState [
	"状態を反転させます。ONならOFFへ、OFFならONへ。"

	self isOn
		ifTrue: [ self turnOff ]
		ifFalse: [ self turnOn ]
]
