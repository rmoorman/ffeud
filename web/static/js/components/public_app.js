import React   from "react"
import Header  from "./public/header.js"
import Answers from "./public/answers.js"
import Strikes from "./public/strikes.js"

let PublicApp = React.createClass({
  getInitialState() {
    return {
      team_1_name: "",
      team_2_name: "",
      team_1_score: 0,
      team_2_score: 0,
      round_info: {
        pot: 0,
        multiplier: 1,
        question: "",
        x_count:  0,
        answers:  []
      }
    }
  },

  componentDidMount() {
    this.props.channel.on("state", payload => {
      this.setState(payload)
    })

    let soundboard = $("#soundboard")

    this.props.channel.on("noise", payload => {
      if (payload.noise == "strike") {
        let path = soundboard.data("strike")
        new Audio(path).play()
      } else if (payload.noise == "right-first") {
        let path = soundboard.data("right-first")
        new Audio(path).play()
      } else if (payload.noise == "right") {
        let path = soundboard.data("right")
        let a = new Audio(path)
        a.volume = 0.4
        a.play()
      } else if (payload.noise == "fm-answer") {
        let path = soundboard.data("fm-answer")
        new Audio(path).play()
      } else if (payload.noise == "fm-bell") {
        let path = soundboard.data("fm-bell")
        new Audio(path).play()
      } else if (payload.noise == "fm-strike") {
        let path = soundboard.data("fm-strike")
        new Audio(path).play()
      }
    })

    this.props.channel.join()
      .receive("ok", resp => {
        console.log("Public join success", resp)
        this.props.channel.push("load_state")
      })
      .receive("error", resp => { console.log("Public join fail", resp) })
  },

  render() {
    return (
      <div>
        <Header  { ...this.state } />
        <Answers { ...this.state } />
        <Strikes { ...this.state } />
      </div>
    )
  }
})

export default PublicApp
