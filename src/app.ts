import {readFileSync, promises} from 'fs';
import _ from 'lodash';

async function readResponseFile(filename: string) {
  try {
    const numberOfFiles = await promises.readdir(filename);
    console.log(numberOfFiles.length);
    return numberOfFiles;
  } catch (err) {
    console.log(err);
    return null;
  }
}

async function readFileSql(filename: string): Promise<any> {
  try {
    const contents = await readFileSync(filename, 'utf-8');
    return contents;
  } catch (err) {
    console.log(err);
  }
}

function compareDataResponseWithExpect(expectData: string, responseData: string, fileNameResponse: string, fileNameExpect: string) {
  let rs = false;
  let result = fileNameResponse+ ' compare with ' +fileNameExpect;

  if (_.isEqual(JSON.parse(expectData), JSON.parse(responseData))) {
    result += ' is PASSED!!!';
  } else {
    result += ' is FAILED!!!';
  }

  return result;
}

async function compare() {
  const numberOfFileResponse = await readResponseFile('src/data/response/API001');
  const numberOfFileExpected = await readResponseFile('src/data/expect/API001');
  let resultCompare = [];
  let index = 1;
  for (let i = 1; i <= numberOfFileResponse.length; i++) {
    let content;
    let expectedData;
    if ( i < 10 ) {
      content = await readFileSql('src/data/response/API001/output_case00' + i + '.json');
      expectedData = await readFileSql('src/data/expect/API001/expected_00' + i + '.json');
    } else if ( 10 <= i && i < 100 ) {
      content = await readFileSql('src/data/response/API001/output_case0' + i + '.json');
      expectedData = await readFileSql('src/data/expect/API001/expected_0' + i + '.json');
    } else {
      content = await readFileSql('src/data/response/API001/output_case' + i + '.json');
      expectedData = await readFileSql('src/data/expect/API001/expected_' + i + '.json');
    }
    index++;
    const stringSplitResponse = content.split('\r\n\r\n');
    let responseData;
    for (let i = 0; i < stringSplitResponse.length; i++) {
      if (stringSplitResponse[i].startsWith('{')) {
        responseData = stringSplitResponse[i];
      }
    }
    resultCompare.push(compareDataResponseWithExpect(expectedData, responseData, numberOfFileResponse[i-1], numberOfFileExpected[i-1]));
  }
  return console.log(resultCompare);
}

compare();