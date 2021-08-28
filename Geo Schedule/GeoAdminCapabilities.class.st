Class {
	#name : #GeoAdminCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #actions }
GeoAdminCapabilities >> addCategory: aRequest [

	| dict category |
	dict := NeoJSONReader fromString: aRequest contents.

	category := schedule addCategory:  dict.

	^ self categoryObjectFor: category
]

{ #category : #actions }
GeoAdminCapabilities >> addDateAndTimeTo: dict [

	| timeString dateString time date |
	dateString := dict at: 'dateString'.
	timeString := dict at: 'timeString'.
	date := Date fromString: dateString.
	time := Time fromString: timeString.
	dict
		at: 'dateAndTime'
		put: (DateAndTime date: date time: time) printString
]

{ #category : #actions }
GeoAdminCapabilities >> addEvent: aRequest [

	| dict event |
	dict := NeoJSONReader fromString: aRequest contents.
	self addDateAndTimeTo: dict.
	event := schedule addEvent: dict.
	^ self eventObjectFor: event
]

{ #category : #actions }
GeoAdminCapabilities >> addUser: aRequest [

	| dict newUser |
	dict := NeoJSONReader fromString: aRequest contents.
	dict at: 'password' put: '1234'.

	newUser := schedule addUser: dict.
	self updateUserCategoryStatusFor: dict user: newUser.

	^ self userObjectFor: newUser
]

{ #category : #accessing }
GeoAdminCapabilities >> categories [

	^ (schedule categories asSortedCollection: [ :catA :catB | 
		   catA name <= catB name ]) collect: [ :category | 
		  self categoryObjectFor: category ]
]

{ #category : #accessing }
GeoAdminCapabilities >> categoryObjectFor: category [

	^ GeoJSONObject new
		  id: category id;
		  name: category name;
		  description: category description;
		  statusPermissions: (GeoJSONObject new
				   event: #( 'open' 'closed' 'finished' 'archived' );
				   user: #( 'confirmedScheduling' 'iCan' 'iCanNot' 'neutral' 'scheduled' );
				   yourself);
		  yourself
]

{ #category : #accessing }
GeoAdminCapabilities >> eventObjectFor: event [

	^ self newJSONObject
		  id: event id;
		  dateAndTime: event dateAndTimeString;
		  status: event status;
		  description: event description;
		  category: event category id;
		  nrOfUsers: event nrOfUsers;
		  location: event location;
		  userStatus:
			  (event userStatus asOrderedCollection collect: [ :each | 
					   self newJSONObject
						   user: each user id;
						   status: each status;
						   yourself ]);
		  yourself
]

{ #category : #accessing }
GeoAdminCapabilities >> events [

	^ schedule events asOrderedCollection 
			collect: [ :event | self eventObjectFor: event ]
]

{ #category : #actions }
GeoAdminCapabilities >> modifyCategory: aRequest [

	| dict category |
	dict := NeoJSONReader fromString: aRequest contents.

	category := schedule modifyCategory:  dict.

	^ self categoryObjectFor: category
]

{ #category : #actions }
GeoAdminCapabilities >> modifyEvent: aRequest [

	| dict event |
	dict := NeoJSONReader fromString: aRequest contents.
	self addDateAndTimeTo: dict.

	event := schedule modifyEvent:  dict.

	^ self eventObjectFor: event
]

{ #category : #actions }
GeoAdminCapabilities >> modifyUser: aRequest [

	| dict newUser |
	dict := NeoJSONReader fromString: aRequest contents.
	
	newUser := schedule modifyUser: dict.
	self updateUserCategoryStatusFor: dict user: newUser.

	^ self userObjectFor: newUser
]

{ #category : #actions }
GeoAdminCapabilities >> updateUserCategoryStatusFor: dict user: newUser [

	(dict at: 'categoryIdStatus') do: [ :catStatDict | 
		catStatDict at: 'user' put: newUser id.
		(catStatDict at: 'status') ifNotEmpty: [ 
			schedule updateUserCategoryStatus: catStatDict ] ]
]

{ #category : #actions }
GeoAdminCapabilities >> updateUserEventStatus: aRequest [

	| dict userEventStatus |

	dict := NeoJSONReader fromString: aRequest contents.

	userEventStatus := schedule updateUserEventStatus: dict.

	^ GeoJSONObject new
		  user: userEventStatus user id;
		  event: userEventStatus event id;
		  status: userEventStatus status;
		  yourself
]

{ #category : #accessing }
GeoAdminCapabilities >> userObjectFor: aUser [

	^ self newJSONObject
		  id: aUser id;
		  name: aUser name;
		  surname: aUser surname;
		  email: aUser email;
		  phone: aUser phone;
		  role: aUser role;
		  websiteRole: aUser websiteRole;
		  categoryStatus:
			  (aUser categoryStatus asOrderedCollection collect: [ :each | 
					   self newJSONObject
						   category: each category id;
						   status: each status;
						   yourself ]);
		  yourself
]

{ #category : #accessing }
GeoAdminCapabilities >> users [

	^ (schedule users 
		asSortedCollection: [ :userA :userB | userA name <= userB name ]) 
		collect: [ :each | self userObjectFor: each ]
]
