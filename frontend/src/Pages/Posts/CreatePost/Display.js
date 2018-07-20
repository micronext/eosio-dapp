import React from 'react';

const Display = ({handleOnChange, formSubmit}) => (
  <div className="createContainer padding-30 border-bottom">
    <div className="card-item padding-30">
      <input
        className="margin-bottom-15"
        name="title"
        onChange={handleOnChange}
        placeholder="Title"
      />
      <textarea
        className="margin-bottom-15"
        name="content"
        onChange={handleOnChange}
        rows={4}
        placeholder="Content"
      />
      <input
        className="margin-bottom-15"
        name="tag"
        onChange={handleOnChange}
        placeholder="Tag"
      />
      <button
        onClick={formSubmit}
        type="submit"
        className="login-form-button"
      >
        Create Post
      </button>
    </div>
  </div>
)
export default Display;