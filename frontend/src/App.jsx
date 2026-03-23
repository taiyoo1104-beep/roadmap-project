import { useEffect, useState } from 'react'

function App() {
  const [roadmaps, setRoadmaps] = useState([])

  useEffect(() => {
    // RailsのAPIからデータを取ってくる
    fetch("http://localhost:3000/api/v1/roadmaps")
      .then((res) => res.json())
      .then((data) => setRoadmaps(data))
      .catch((err) => console.error(err))
  }, [])

  return (
    <div style={{ padding: "20px" }}>
      <h1>My Roadmaps</h1>
      {roadmaps.map((roadmap) => (
        <div key={roadmap.id} style={{ border: "1px solid #ccc", margin: "10px", padding: "10px" }}>
          <h2>{roadmap.title} (目標: {roadmap.target_date})</h2>
          <ul>
            {roadmap.tasks?.map((task) => (
              <li key={task.id}>
                {task.is_completed ? "✅" : "⬜"} {task.content}
              </li>
            ))}
          </ul>
        </div>
      ))}
    </div>
  )
}

export default App