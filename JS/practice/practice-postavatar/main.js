const avatarData = {
  hairType: 'short2',
  hairColor: 'brown',
  skin: 'tone200',
  clothes: 'hoodie',
  accessories: 'earbuds',
};

// 여기에 코드를 작성하세요.

const res = await fetch ('https://learn.codeit.kr/api/avatars',{
  method : 'POST',
  body : JSON.stringify(avatarData),
  headers : {
    'content-type' : 'application/json',
  },
});

const data = await res.json();

console.log(data);