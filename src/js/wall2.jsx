import React, { PropTypes } from 'react';
import { connect } from 'react-redux';
import Tweet from './tweet.jsx';

function Wall1(props){
  const tweets = props.wall;
  var styleContainer = {
    maxWidth: 1100,
    margin: 'auto'
  };
  var styleContainerRight = {
    width: 49 + '%',
    float: 'right'
  };

  return <div style={styleContainer} className="container-wall">
    <div style={styleContainerRight} className="container-wall-left">
      {tweets.map((item, i) => <Tweet key={item._id} index={i} {...item} />)}
    </div>
  </div>;
}

Wall1.propTypes = {
  wall: PropTypes.any,
  attributes: PropTypes.any
};
export default connect(wall => {
  return {
    wall
  };
})(Wall1);