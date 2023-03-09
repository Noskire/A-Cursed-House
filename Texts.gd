extends Node

# Mother, father, older brother, younger brother, sister
var actors = ["Raya", "Amadeo", "Matty", "Teodor", "Danae"]
var colors = ["#f9de8b", "#f1dfc6", "#eb7ea2", "#466ac0", "#62d8ad"]
var family_name = "McNeil"

var intro = ["The more I clean, the dirtier it gets, how is that possible?! That way I'll never finish cleaning this room!",
			"The woman only thinks about cleaning the house, the boys only know how to fight, the girl is the only one who has any sense. *Sighs* Why did I want to have so many kids?",
			(actors[3] + ", that bastard! He thinks he can do whatever he wants and I'm just going to keep quiet? I will kill him!"),
			("*Sigh* Why doesn't " + actors[2] + " believe me? I already said it was an accident, but he doesn't listen to me!"),
			"\"Nam doloribus harum aut maiores quia est quae quibusdam et perspiciatis minus.\" Eh? No, that's not it! Revertere! Retrorsum converti! Nam!"]

var rand = [["*Sweep, sweep, sweep…*", "If it gets dirtier than that, I give up!", "How long has it been since I came to clean this up?"],
			["Fix that posture! Yeah, yourself, on the other side of the screen!", "I'm thirsty...", "Where is the little one? I haven't seen her for a while..."],
			["Grrr… That damn cheater!", "If I had some acid or something...", "Oh, but he'll see! When he least expects it..."],
			["What do I need to do for him to listen to me?", "If he just read the diary...", "I hope he forgives me in time..."],
			["What did I do?", "I need to wake up!", "This is not what I wanted..."]]

var good_endings = 0
var bad_endings = 0

var good_end = ["Finally, finally!",
				"Nothing better than a cold beer...",
				"Oh, he was right… Shit, I need to apologize to him!",
				"No need to apologize, silly. We are brothers, aren't we?",
				"At last we are free!"]

var neutral_end = "I'm sorry, father, mother, brothers... I should never have opened that book!"

var bad_end = ["AAAAAAAHHHHHH! I CAN'T TAKE IT ANYMORE!",
				("Hey, what's that noise?! " + actors[3] + "?! " + actors[3] + "!"),
				"I'll make him regret it bitterly...",
				"*Gasps* *Cough* *Cough* *Thud!*",
				"I cursed my family... Forever!"]
