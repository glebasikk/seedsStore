import React from 'react';
import styled from 'styled-components';
import leftBtn from './left.svg'; // Svg Icon
import rightBtn from './right.svg';  // Svg Icon
const Button = styled.img`
  position: absolute;
  top: 50%;
  z-index: 10;
  cursor: pointer;
  font-size: 15px;
  transform: translateY(-50%);
  left: ${props => props.side === 'prev' && 5}px;
  right: ${props => props.side === 'next' && 5}px;
`;
function Buttons({ handleClickPrev, handleClicknext }) {
  return (
    <>
      <Button src={leftBtn} style={{ height: 53, width: 36 }} side="prev" onClick={handleClickPrev} />
      <Button src={rightBtn} style={{ height: 53, width: 36 }} side="next" onClick={handleClicknext} />
    </>
  );
}export default Buttons;