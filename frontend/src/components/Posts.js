import React from 'react';
import { object, shape, func } from 'prop-types';

import Create from './Create';
import Logo from './assets/img/logo-inverted.svg';

const Posts = (props, context) => {
  // console.log("Posts props:");
  // console.log(props);
  // console.log("Posts context:");
  // console.log(context.store);
  return (
    <div className={ "layoutStandard " + (context.store.createOpen ? 'createOpen' : '') }>
      <div className="logo">
        <a href="/"><img src={Logo} alt="Eos.io"/></a>
      </div>
      <div className="search">
        <input placeholder="Search" onKeyUp={context.handleKeyPress} />
      </div>
      <div className="main">
        <div className="toggleCreate" onClick={context.toggleCreate} >
          <span></span>
          <span></span>
        </div>
        <Create
          handlePostChange={context.handlePostChange}
          handlePostSubmit={context.handlePostSubmit}
        />
        <div className="cards">
          {context.store.posts.map(({ pkey, title, author, content, likes, tag }, index) => (
            <div className='card-item' key={index}>
              <div className="padding-30">
                <p>Title {title}</p>
                <p>By {author}</p>
                <p>Content {content}</p>
                <p>Likes {likes}</p>
                <p>Tag {tag}</p>
              </div>
            </div>
          ))}
        </div>
      </div>
    </div>
)}

Posts.contextTypes = {
  store: object,
  location: shape({}),
  handlePostChange: func,
  createPost: func,
  handlePostSubmit: func,
  toggleCreate: func,
};

export default Posts;