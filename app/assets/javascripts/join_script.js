

const guesses = []
let guessesRemaining = noOfLetters + 1
let currentGuess = ""


addEventListener('keydown', (e) => {
    if (guessesRemaining <= 0) return

    let keyStroke = e.key
    // check if keystroke is a single alphaber
    if (keyStroke.length===1 && keyStroke.match(/[a-zA-Z]/)){
        keyStroke = keyStroke.toUpperCase()

        addLetter(keyStroke)
    }
    if (keyStroke === "Backspace"){
        removeLetter()
    }

    if (keyStroke === "Enter") {
        checkGuess()
    }

} )

const addLetter = (letter) => {
    if(currentGuess.length === noOfLetters) return

    const guessRow = document.getElementsByClassName('guess-row')[noOfLetters + 1 - guessesRemaining]
    const guessLetter = guessRow.children[currentGuess.length]
    guessLetter.innerHTML = letter
    currentGuess = currentGuess+letter
}

const removeLetter = () => {
    if(currentGuess === "") return 
    const guessRow = document.getElementsByClassName('guess-row')[noOfLetters + 1 - guessesRemaining]
    const guessLetter = guessRow.children[currentGuess.length - 1]
    guessLetter.innerHTML = ""
    currentGuess = currentGuess.substring(0, currentGuess.length - 1)
}

const checkGuess = async () =>  {
    const response = await fetch(`/guess?guessedWord=${currentGuess}&roomID=${roomID}`).then(response => response.json())
    // loop through each number in response
    // if number is 0, then it is a correct guess
    // if number is 1, then it is a correct guess but in the wrong position
    // if number is 2, then it is a wrong guess

    const guessRow = document.getElementsByClassName('guess-row')[noOfLetters + 1 - guessesRemaining]
    const guessLetters = guessRow.children
    let nonAbsent = ""
    for (let i = 0; i < response.length; i++) {
        const guessLetter = guessLetters[i]
        if (response[i] === 0) {
            guessLetter.classList.add('correct')
            nonAbsent = nonAbsent + currentGuess[i]
        } else if (response[i] === 1) {
            guessLetter.classList.add('present')
            nonAbsent = nonAbsent + currentGuess[i]
        } else {
            guessLetter.classList.add('absent')
        }
    }
    for (let i=0; i<response.length; i++){
        if(!nonAbsent.includes(currentGuess[i]))
            disableKey(currentGuess[i])
    }

    guessesRemaining--
    currentGuess = ""
}

const disableKey = (key) => {
    const keyElement = document.getElementById(`key-${key}`)
    keyElement.classList.add('keyboard-button-disabled')
}