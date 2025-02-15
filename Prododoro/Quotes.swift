//
//  Quotes.swift
//  Prododoro
//
//  Created by Karen Diaz on 6/27/24.
//

import Foundation

struct Variables {

    static let quotes: [String] = [
        "“Learn as if you will live forever, live like you will die tomorrow.”",
        "“Nature has given us all the pieces required to achieve exceptional wellness and health, but has left it to us to put these pieces together.”",
        "“Success is not final; failure is not fatal: It is the courage to continue that counts.”",
        "“I never dreamed about success. I worked for it.”",
        "“The pessimist sees difficulty in every opportunity. The optimist sees opportunity in every difficulty.”",
        "“Don’t let yesterday take up too much of today.”",
        "“You learn more from failure than from success. Don’t let it stop you. Failure builds character.”",
        "“Either you run the day or the day runs you.”",
        "“When we strive to become better than we are, everything around us becomes better too.”",
        "“Setting goals is the first step in turning the invisible into the visible.”",
        "“You’ve got to get up every morning with determination if you’re going to go to bed with satisfaction.”",
        "“The most difficult thing is the decision to act; the rest is merely tenacity.”",
        "“The standard you walk past is the standard you accept.”",
        "“Keep your eyes on the stars, and your feet on the ground.”",
        "“Perfection is not attainable. But if we chase perfection we can catch excellence.”",
        "“The elevator to success is out of order. You’ll have to use the stairs, one step at a time.”",
        "“Work until your bank account looks like a phone number.”",
        "“Just one small positive thought in the morning can change your whole day.”",
        "“Opportunities don’t happen, you create them.”",
        "“It is never too late to be what you might have been.”",
        "“I am not a product of my circumstances. I am a product of my decisions.”",
        "“If you can dream it, you can do it.”",
        "“Do what you can, with what you have, where you are.”",
        "“I’d rather regret the things I’ve done than regret the things I haven’t done.”",
        "“When you arise in the morning, think of what a privilege it is to be alive, to think, to enjoy, to love.”",
        "“You cannot plow a field by turning it over in your mind. To begin, begin.”",
        "“Inspiration does exist, but it must find you working.”",
        "“Someone’s sitting in the shade today because someone planted a tree a long time ago.”",
        "“Small is not just a stepping stone. Small is a great destination itself.”",
        "“The only one who can tell you ‘you can’t win’ is you, and you don’t have to listen.”",
        "“Set your goals high, and don’t stop till you get there.”",
        "“Life is like riding a bicycle. To keep your balance, you must keep moving.”",
        "“If you can’t yet do great things, do small things in a great way.”",
        "“What you do speaks so loudly that I cannot hear what you say.”",
        "“Do not wait for the perfect time and place to enter, for you are already onstage.”",
        "“The only way of discovering the limits of the possible is to venture a little way past them into the impossible.”",
        "“I never look back, darling. It distracts from the now.”",
        "“A year from now you will wish you had started today.”",
        "“Somewhere, something incredible is waiting to be known.”",
        "“If you don’t risk anything, you risk even more.”",
        "“Our greatest glory is not in never falling, but in rising every time we fall.”",
        "“If you change the way you look at things, the things you look at change.”",
        "“It’s fine to celebrate success, but it is more important to heed the lessons of failure.”",
        "“Start where you are. Use what you have. Do what you can.”",
        "“We are what we repeatedly do. Excellence, then, is not an act, but a habit.”",
        "“The question isn’t who is going to let me; it’s who is going to stop me.”",
        "“Every strike brings me closer to the next home run.”",
        "“Everything you’ve ever wanted is sitting on the other side of fear.”",
        "“The best way out is always through.”",
        "“If there is no struggle, there is no progress.”",
        "“If you don’t like the road you’re walking, start paving another one.”",
        "“Some people want it to happen, some wish it would happen, others make it happen.”",
        "“I choose to make the rest of my life the best of my life.”",
        "“Don’t settle for average. Bring your best to the moment. Then, whether it fails or succeeds, at least you know you gave all you had.”",
        "“Take your victories, whatever they may be, cherish them, use them, but don’t settle for them.”",
        "“Courage doesn’t always roar. Sometimes courage is a quiet voice at the end of the day saying, ‘I will try again tomorrow.’”"
    ]

    static let authors: [String] = [
        "Mahatma Gandhi",
        "Diane McLaren",
        "Winston Churchill",
        "Estée Lauder",
        "Winston Churchill",
        "Will Rogers",
        "Unknown",
        "Jim Rohn",
        "Paulo Coelho",
        "Tony Robbins",
        "George Lorimer",
        "Amelia Earhart",
        "David Hurley",
        "Theodore Roosevelt",
        "Vince Lombardi",
        "Joe Girard",
        "Unknown",
        "Dalai Lama",
        "Chris Grosser",
        "George Eliot",
        "Stephen R. Covey",
        "Walt Disney",
        "Theodore Roosevelt",
        "Lucille Ball",
        "Marcus Aurelius",
        "Gordon B. Hinckley",
        "Pablo Picasso",
        "Warren Buffet",
        "Jason Fried",
        "Jessica Ennis",
        "Bo Jackson",
        "Albert Einstein",
        "Napoleon Hill",
        "Ralph Waldo Emerson",
        "Unknown",
        "Arthur C. Clarke",
        "Edna Mode",
        "Unknown",
        "Carl Sagan",
        "Erica Jong",
        "Confucius",
        "Wayne Dyer",
        "Bill Gates",
        "Arthur Ashe",
        "Aristotle",
        "Ayn Rand",
        "Babe Ruth",
        "George Addair",
        "Robert Frost",
        "Frederick Douglass",
        "Dolly Parton",
        "Michael Jordan",
        "Louise Hay",
        "Angela Bassett",
        "Mia Hamm",
        "Mary Anne Radmacher"
    ]
    
    static let breakReminders : [String] = [
            "drink some water!", "have a snack!", "stand up and stretch!", "take some deep breaths!", "listen to a song!", "take a break!"
        ]
    static var randomBreak = Int.random(in: 0...(breakReminders.count - 1))
    static var breakReminder = breakReminders[randomBreak]
    static var randomQuote = Int.random(in: 0...(quotes.count-1))
    static let quote = quotes[randomQuote]
    static let author = authors[randomQuote]
}



