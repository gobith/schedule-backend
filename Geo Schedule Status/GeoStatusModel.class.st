Class {
	#name : #GeoStatusModel,
	#superclass : #Object,
	#instVars : [
		'status'
	],
	#classVars : [
		'statusDict'
	],
	#category : #'Geo Schedule Status'
}

{ #category : #'accessing-model' }
GeoStatusModel class >> adminStatus [

	^self new adminStatus 
]

{ #category : #'accessing-event' }
GeoStatusModel class >> archived [

	^ GeoEventStatus new
		  symbol: 'archived';
		  name: 'Gearchiveerd';
		  menuName: 'Archiveer';
		  yourself
]

{ #category : #'accessing-event' }
GeoStatusModel class >> closed [

	^ GeoEventStatus new
		  symbol: 'closed';
		  name: 'Gesloten';
		  menuName: 'Sluit';
		  yourself
]

{ #category : #accessing }
GeoStatusModel class >> colorForEventStatus: eventStatusSymbol userStatus: userStatusSymbol [

	| eventStatus userStatusColor |
	eventStatus := self statusDict at: eventStatusSymbol.
	userStatusColor := self statusDict
		                   at: userStatusSymbol
		                   ifPresent: [ :userStatus | userStatus color ]
		                   ifAbsent: [ Color white ].
	^ eventStatus filteredColorFor: userStatusColor
]

{ #category : #'accessing-user' }
GeoStatusModel class >> confirmed [

	^ GeoUserStatus new
		  symbol: 'confirmedScheduling';
		  name: 'Bevestigd';
			menuName: 'Bevestigen';
		  color: Color blue darker;
		  yourself
]

{ #category : #'accessing-user' }
GeoStatusModel class >> confirmedDriver [

	^ GeoUserStatus new
		  symbol: 'confirmedSchedulingDriver';
		  name: 'Bevestigd Chauffeur';
			menuName: 'Bevestigen Chauffeur';
		  color: Color blue darker;
		  yourself
]

{ #category : #'accessing-event' }
GeoStatusModel class >> finished [

	^ GeoEventStatus new
		  symbol: 'finished';
		  name: 'Voltooid';
		  menuName: 'Voltooien';
		  yourself
]

{ #category : #'accessing-user' }
GeoStatusModel class >> iCan [

	^ GeoUserStatus new
		  symbol: 'iCan';
		  name: 'Ik Kan Wel';
			menuName: 'Ik Kan Wel';
		  color: Color green;
		  yourself
]

{ #category : #'accessing-user' }
GeoStatusModel class >> iCanNot [

	^ GeoUserStatus new
		  symbol: 'iCanNot';
		  name: 'Ik Kan Niet';
			menuName: 'Ik Kan Niet';
		  color: Color red;
		  yourself
]

{ #category : #'accessing-user' }
GeoStatusModel class >> neutral [

	^ GeoUserStatus new
		  symbol: 'neutral';
		  name: 'Nog Niet Gekozen';
			menuName: 'Nog Niet Gekozen';
		  color: Color white;
		  yourself
]

{ #category : #'accessing-model' }
GeoStatusModel class >> normalStatus [

	^self new normalStatus 
]

{ #category : #'accessing-event' }
GeoStatusModel class >> open [

	^ GeoEventStatus new
		  symbol: 'open';
		  name: 'Open';
		  menuName: 'Open';
		  yourself
]

{ #category : #'accessing-user' }
GeoStatusModel class >> scheduled [

	^ GeoUserStatus new
		  symbol: 'scheduled';
		  name: 'Ingepland';
			menuName: 'Plan in';
		  color: Color blue lighter;
		  yourself
]

{ #category : #accessing }
GeoStatusModel class >> statusDict [

	statusDict ifNil: [ 
		statusDict := Dictionary new.

		{ 
			self archived.
			self closed.
			self finished.
			self open.
			self confirmed.
			self iCan.
			self iCanNot.
			self neutral.
			self scheduled .
			self confirmedDriver } do: [ :status | 
			statusDict at: status symbol put: status ] ].
	^ statusDict
]

{ #category : #accessing }
GeoStatusModel >> add: aStatus [

	| statusNext |
	statusNext := GeoStatusNext new
		              status: aStatus;
		              yourself.
	status at: aStatus symbol put: statusNext.
	^ statusNext
]

{ #category : #'accessing-model' }
GeoStatusModel >> adminStatus [

	(self add: self open) 
		next: self closed.
	(self add: self closed)
		next: self finished;
		next: self open.
	(self add: self archived) 
		next: self open.
	(self add: self finished) 
		next: self archived.
		
	(self add: self iCan)
		next: self neutral;
		next: self iCanNot; 
		next: self scheduled;
		next: self confirmed.	
	(self add: self iCanNot)
		next: self neutral;
		next: self iCan; 
		next: self scheduled;
		next: self confirmed.
	(self add: self neutral)
		next: self iCan;
		next: self iCanNot; 
		next: self scheduled;
		next: self confirmed.
	(self add: self scheduled)
		next: self iCan;
		next: self iCanNot; 
		next: self neutral;
		next: self confirmed.
	(self add: self confirmed)
		next: self iCan;
		next: self iCanNot; 
		next: self neutral;
		next: self scheduled.
		
		
	^status
]

{ #category : #accessing }
GeoStatusModel >> archived [

	^self class statusDict at: 'archived'
]

{ #category : #accessing }
GeoStatusModel >> closed [

	^self class statusDict at: 'closed'
]

{ #category : #accessing }
GeoStatusModel >> confirmed [

	^self class statusDict at: 'confirmedScheduling'
]

{ #category : #accessing }
GeoStatusModel >> finished [

	^self class statusDict at: 'finished'
]

{ #category : #accessing }
GeoStatusModel >> iCan [

	^self class statusDict at: 'iCan'
]

{ #category : #accessing }
GeoStatusModel >> iCanNot [

	^self class statusDict at: 'iCanNot'
]

{ #category : #initialization }
GeoStatusModel >> initialize [

	super initialize.
	status := Dictionary new.

]

{ #category : #accessing }
GeoStatusModel >> neutral [

	^self class statusDict at: 'neutral'
]

{ #category : #'accessing-model' }
GeoStatusModel >> normalStatus [

	(self add: self iCan)
		next: self neutral;
		next: self iCanNot.
	(self add: self iCanNot)
		next: self neutral;
		next: self iCan.
	(self add: self neutral)
		next: self iCan;
		next: self iCanNot.
	(self add: self scheduled) 
		next: self confirmed.
	self add: self confirmed.


	^ status
]

{ #category : #accessing }
GeoStatusModel >> open [

	^self class statusDict at: 'open'
]

{ #category : #accessing }
GeoStatusModel >> scheduled [

	^self class statusDict at: 'scheduled'
]
