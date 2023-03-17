import React, { useState } from 'react';

function UserForm() {
    // const url = 'http://localhost:8080';
    const[isSubmitted, setIsSubmitted] = useState(false);
    const url = `${process.env.REACT_APP_BACKEND_BASE_URL}`;
    console.log(url);
    const handleSubmit = async (event) => {
        event.preventDefault();
        const formData = new FormData(event.target);

    const jsonData = {};
    for (let [key, value] of formData.entries()) {
        jsonData[key] = value;
    }

    const response = await fetch(`${url}/save`, {
        method: 'POST',
        headers: {
            'Content-Type': 'application/json' 
        },
        body: JSON.stringify(jsonData)
      });
      if(response.ok){
        setIsSubmitted(true);
      }

    }    


  return (
    <>
    {!isSubmitted ? (
    <form onSubmit={handleSubmit}>
    <label>
      Firstname:
      <input type="text" name='firstName' />
    </label>
    <br/>
    <label>
      Lastname:
      <input type="text" name='lastName' />
    </label> 
    <br/> 
    <label>
      Username:
      <input type="text" name='username' />
    </label>
    <br/>               
    <label>
      Email:
      <input type="email" name='email' />
    </label>
    <br />
    <label>
      Address:
      <input type="text" name='address' />
    </label>
    <br />
    <button type="submit">Submit</button>
  </form>

    ): (
      <p>Thank you for submitting the form!</p>
    )}
    </>
  );
}

export default UserForm;
