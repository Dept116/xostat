import React from "react";
import { useEffect } from "react";
import { Col, Card, Row, Container } from "react-bootstrap";
import { MathComponent } from "mathjax-react";
import { useDispatch, useSelector } from "react-redux";
import { RootState } from "../../../redux/store";
import { getProfileData } from "../../../redux/slices/profile";

const Totals = () => {
  const dispatch = useDispatch();

  const { games, wins, mvp, tot_kills, tot_assists } = useSelector(
    (state: RootState) => state.profile
  );

  useEffect(() => {
    dispatch(getProfileData("7907969"));
  }, [dispatch]);

  let winRate = 0;
  let mvpRate = 0;
  let contribRate = 0;

  if (games > 0) {
    winRate = (100.0 * wins) / games;
    mvpRate = (100.0 * mvp) / games;
    contribRate = (100.0 * (tot_kills + tot_assists)) / games;
  }

  return (
    <Col md="6" xl className="d-flex">
      <Card className="flex-fill">
        <Card.Body className="py-4">
          <Container>
            <Row>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Games</h3>
                    <p className="mb-2">{games}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Wins</h3>
                    <p className="mb-2">{wins}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">WR</h3>
                    <p className="mb-2">{winRate}%</p>
                  </div>
                </div>
              </Col>
            </Row>
            <Row>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">MVP</h3>
                    <p className="mb-2">{mvp}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">MVP%</h3>
                    <p className="mb-2">{mvpRate}%</p>
                  </div>
                </div>
              </Col>
            </Row>
            <Row>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Kills</h3>
                    <p className="mb-2">{tot_kills}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h3 className="mb-2">Assists</h3>
                    <p className="mb-2">{tot_assists}</p>
                  </div>
                </div>
              </Col>
              <Col>
                <div className="row d-flex justify-content-center">
                  <div className="flex-grow-1 justify-content-center">
                    <h2 className="mb-2">
                      <MathComponent
                        mathml={String.raw`
                        <math>
                          <mrow>
                            <mfrac>
                            <mi>K+A</mi>
                            <mi>G</mi>
                            </mfrac>
                          </mrow>
                        </math>
                        `}
                      />
                    </h2>
                    <p className="mb-2">{contribRate}%</p>
                  </div>
                </div>
              </Col>
            </Row>
          </Container>
        </Card.Body>
      </Card>
    </Col>
  );
};

export default Totals;
