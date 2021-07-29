Class {
	#name : #GeoUpdateUserCategoryStatus,
	#superclass : #GeoAction,
	#category : #'Geo Schedule Actions'
}

{ #category : #actions }
GeoUpdateUserCategoryStatus >> addTo: aSchedule [

	| user category status userCategoryStatus |
	user := aSchedule users at: (payload at: 'user').
	category := aSchedule categories at: (payload at: 'category').
	status := payload at: 'status'.

	userCategoryStatus := GeoUserCategoryStatus new.
	userCategoryStatus
		user: user;
		category: category;
		status: status.

	category userStatus at: user id put: userCategoryStatus.
	user categoryStatus at: category id put: userCategoryStatus.
	^ userCategoryStatus
]
