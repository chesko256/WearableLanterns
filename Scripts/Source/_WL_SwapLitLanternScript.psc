scriptname _WL_SwapLitLanternScript extends ObjectReference

import utility

Light property DroppedLitForm auto
Armor property InvDisplayForm auto
Actor property PlayerRef auto

float myXOffset
float myYOffset

Event OnInit()
	self.MoveTo(self, 0.0, 0.0, -500.0)
	self.SetAngle(0.0, 0.0, 0.0)
	GetOffset()
	self.MoveTo(PlayerRef, myXOffset, myYOffset, 35.0)
	utility.wait(0.2)
	self.ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)		;Force to fall to the ground, like an item drop
	utility.wait(0.1)
	self.ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)
	utility.wait(0.1)
	self.ApplyHavokImpulse(0.0, 0.0, -1.0, 1.0)
endEvent

Event OnContainerChanged(ObjectReference akNewContainer, ObjectReference akOldContainer)
	if akNewContainer == PlayerRef
		PlayerRef.AddItem(InvDisplayForm, abSilent = true)
		PlayerRef.EquipItem(InvDisplayForm, abSilent = true)
		PlayerRef.RemoveItem(DroppedLitForm, abSilent = true)
	endif
endEvent

function GetOffset()
	;Trigonometry time! We need to position the campsite item such that it is dropped in front of the player.
	int myQuad = 1
	float mySideC = 100.0	;Hypotenuse (distance to move the object forward)
	float randOffset = RandomFloat(-90.0, 90.0)
	float myAngleA = (Game.GetPlayer().GetAngleZ() + randOffset)
	
	float myAngleC = 90.0
	
	;Clamp to an angle less than 90 degrees.
	if myAngleA > 90.0 && myAngleA <= 180.0
		myAngleA -= 90.0
		myQuad = 2
	elseif myAngleA > 180.0 && myAngleA <= 270.0
		myAngleA -= 180.0
		myQuad = 3
	elseif myAngleA > 270.0
		myAngleA -= 270.0
		myQuad = 4
	endif
	
	float mySideA
	float mySideB
	
	;Determine the length of the legs of the triangle for moving the player.
	if myQuad == 1 || myQuad == 3
		mySideA = math.sin(myAngleA) * mySideC				;Y offset
		mySideB = math.cos(myAngleA) * mySideC				;X offset
	else
		mySideA = math.cos(myAngleA) * mySideC				;Y offset
		mySideB = math.sin(myAngleA) * mySideC				;X offset
	endif
	
	;Figure out which direction the offset should travel based on the quadrant.
		
	if myQuad == 1
		;Move farther into the 1st quadrant
		myXOffset = mySideA
		myYOffset = mySideB
	elseif myQuad == 2
		;Move farther into the 2nd quadrant
		myXOffset = mySideA
		myYOffset = mySideB * -1.0
	elseif myQuad == 3
		;Move farther into the 3rd quadrant
		myXOffset = mySideA * -1.0
		myYOffset = mySideB * -1.0
	elseif myQuad == 4
		;Move farther into the 4th quadrant
		myXOffset = mySideA * -1.0
		myYOffset = mySideB
	endif
endFunction