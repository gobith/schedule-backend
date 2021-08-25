Class {
	#name : #GeoAdminCapabilities,
	#superclass : #GeoCapabilities,
	#category : #'Geo Schedule-Capabilities'
}

{ #category : #accessing }
GeoAdminCapabilities >> addCategory: aRequest [

	| dict category |
	dict := NeoJSONReader fromString: aRequest contents.

	category := schedule addCategory:  dict.

	^ self categoryObjectFor: category
]

{ #category : #accessing }
GeoAdminCapabilities >> addEvent: aRequest [

	| dict event dateString timeString date time |

	dict := NeoJSONReader fromString: aRequest contents.

	dateString := dict at: 'dateString'.
	timeString := dict at: 'timeString'.
	date := Date fromString: dateString.
	time := Time fromString: timeString.
	dict at: 'dateAndTime' put: (DateAndTime date: date time: time) printString .
	

	event := schedule addEvent:  dict.

	^ self eventObjectFor: event
]

{ #category : #accessing }
GeoAdminCapabilities >> addUser: aRequest [

	| dict |

	self halt.

	dict := NeoJSONReader fromString: aRequest contents.


	"| dict event dateString timeString date time |


	dict := NeoJSONReader fromString: aRequest contents.

	dateString := dict at: 'dateString'.
	timeString := dict at: 'timeString'.
	date := Date fromString: dateString.
	time := Time fromString: timeString.
	dict at: 'dateAndTime' put: (DateAndTime date: date time: time) printString .
	

	event := schedule addEvent:  dict.

	^ self eventObjectFor: event"
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

{ #category : #'accessing requests' }
GeoAdminCapabilities >> modifyUser: aRequest [

	| dict usr |
	dict := NeoJSONReader fromString: aRequest contents.

	usr := schedule modifyUser: dict.

	^ self userObjectFor: usr
]

{ #category : #'accessing requests' }
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
		  showInSchedule: aUser showInSchedule;
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
