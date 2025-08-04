import HandIcon from './HandIcon';
import './HandButton.css';

// CSS 파일로 스타일을 적용해 주세요
function HandButton({ value, onClick }) {
  const handleClick = () => onClick(value);
  const classNameBtn = ['HandButton'] ;
  const classNameIcon = ['HandButton-icon'];
  return (
    <button className={classNameBtn} onClick={handleClick}>
      <HandIcon className={classNameIcon} value={value} />
    </button>
  );
}

export default HandButton;
